import type { CollectionAfterChangeHook } from 'payload'
import { transporter, mailFrom } from './mailer'

type SubmissionField = { field: string; value: string }

type EmailSettings = {
  sendConfirmationEmail?: boolean
  submitterEmailField?: string
  confirmationSubject?: string
  confirmationBody?: string
  sendNotificationEmail?: boolean
  notifyTo?: string
  notificationSubject?: string
  notificationBody?: string
}

function buildFieldsTable(fields: SubmissionField[]): string {
  const rows = fields
    .map(
      ({ field, value }) =>
        `<tr>` +
        `<td style="padding:8px 14px;border:1px solid #e5e7eb;font-weight:600;background:#f9fafb;">${field}</td>` +
        `<td style="padding:8px 14px;border:1px solid #e5e7eb;">${value || '—'}</td>` +
        `</tr>`,
    )
    .join('')
  return (
    `<table style="border-collapse:collapse;width:100%;font-family:sans-serif;font-size:14px;margin-top:8px;">` +
    rows +
    `</table>`
  )
}

function substituteTemplate(template: string, fields: SubmissionField[], formTitle: string): string {
  let html = template
  for (const { field, value } of fields) {
    html = html.replace(new RegExp(`\\{\\{${field}\\}\\}`, 'gi'), value || '')
  }
  html = html.replace(/\{\{allFields\}\}/gi, buildFieldsTable(fields))
  html = html.replace(/\{\{formTitle\}\}/gi, formTitle)
  return html
}

function defaultConfirmationBody(formTitle: string, fields: SubmissionField[]): string {
  return `
<div style="font-family:sans-serif;max-width:600px;margin:0 auto;padding:32px;background:#ffffff;">
  <div style="background:#1e3a5f;padding:24px 32px;border-radius:8px 8px 0 0;">
    <h2 style="color:#ffffff;margin:0;font-size:22px;">Thank you for your submission!</h2>
  </div>
  <div style="border:1px solid #e5e7eb;border-top:none;padding:32px;border-radius:0 0 8px 8px;">
    <p style="color:#374151;margin-top:0;">We have received your submission for <strong>${formTitle}</strong>. We'll be in touch shortly.</p>
    <h3 style="color:#1e3a5f;font-size:16px;margin-top:24px;">Your submission details:</h3>
    ${buildFieldsTable(fields)}
    <p style="margin-top:32px;color:#9ca3af;font-size:12px;border-top:1px solid #f3f4f6;padding-top:16px;">
      This is an automated confirmation. Please do not reply to this email.
    </p>
  </div>
</div>`
}

function defaultNotificationBody(formTitle: string, fields: SubmissionField[]): string {
  return `
<div style="font-family:sans-serif;max-width:600px;margin:0 auto;padding:32px;background:#ffffff;">
  <div style="background:#1e3a5f;padding:24px 32px;border-radius:8px 8px 0 0;">
    <h2 style="color:#ffffff;margin:0;font-size:22px;">New Form Submission</h2>
  </div>
  <div style="border:1px solid #e5e7eb;border-top:none;padding:32px;border-radius:0 0 8px 8px;">
    <p style="color:#374151;margin-top:0;">A new submission was received for <strong>${formTitle}</strong>.</p>
    <h3 style="color:#1e3a5f;font-size:16px;margin-top:24px;">Submission details:</h3>
    ${buildFieldsTable(fields)}
  </div>
</div>`
}

export const sendFormNotificationEmails: CollectionAfterChangeHook = async ({
  doc,
  operation,
  req,
}) => {
  if (operation !== 'create') return

  try {
    const formId = typeof doc.form === 'object' ? (doc.form as { id: string }).id : (doc.form as string)
    const submissionData: SubmissionField[] = (doc.submissionData as SubmissionField[]) ?? []

    const form = await req.payload.findByID({
      collection: 'forms',
      id: formId,
      depth: 0,
    })

    if (!form) return

    const emailSettings = ((form as unknown as { emailSettings?: EmailSettings }).emailSettings) ?? {}
    const formTitle: string = (form as unknown as { title?: string }).title ?? 'Form'

    // --- Confirmation email to submitter ---
    if (emailSettings.sendConfirmationEmail !== false) {
      const emailFieldName = emailSettings.submitterEmailField?.trim() || 'email'
      const submitterEmail = submissionData.find(
        (f) => f.field.toLowerCase() === emailFieldName.toLowerCase(),
      )?.value?.trim()

      if (submitterEmail && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(submitterEmail)) {
        const subject = emailSettings.confirmationSubject?.trim() || `Thank you for your submission — ${formTitle}`
        const html = emailSettings.confirmationBody
          ? substituteTemplate(emailSettings.confirmationBody, submissionData, formTitle)
          : defaultConfirmationBody(formTitle, submissionData)

        await transporter.sendMail({ from: mailFrom, to: submitterEmail, subject, html })
        req.payload.logger.info(`Confirmation email sent to ${submitterEmail} for form "${formTitle}"`)
      }
    }

    // --- Notification email to form owner ---
    if (emailSettings.sendNotificationEmail !== false) {
      const notifyTo = emailSettings.notifyTo?.trim() || process.env.MAIL_FROM || process.env.MAIL_USER || ''
      if (notifyTo) {
        const subject = emailSettings.notificationSubject?.trim() || `New submission: ${formTitle}`
        const html = emailSettings.notificationBody
          ? substituteTemplate(emailSettings.notificationBody, submissionData, formTitle)
          : defaultNotificationBody(formTitle, submissionData)

        await transporter.sendMail({ from: mailFrom, to: notifyTo, subject, html })
        req.payload.logger.info(`Notification email sent to ${notifyTo} for form "${formTitle}"`)
      }
    }
  } catch (err) {
    // Don't let email failure break the submission
    req.payload.logger.error({ err }, 'Failed to send form notification email')
  }
}
