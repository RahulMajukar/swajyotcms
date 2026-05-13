import { postgresAdapter } from '@payloadcms/db-postgres'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
import { formBuilderPlugin } from '@payloadcms/plugin-form-builder'
import path from 'path'
import { buildConfig } from 'payload'
import { fileURLToPath } from 'url'
import sharp from 'sharp'

import { sendFormNotificationEmails } from './lib/formMailer'

import { Users } from './collections/Users'
import { Media } from './collections/Media'
import { Solutions } from './collections/Solutions'
import { Services } from './collections/Services'
import { Industries } from './collections/Industries'
import { Partners } from './collections/Partners'
import { Webinars } from './collections/Webinars'
import { Team } from './collections/Team'
import { ContactSubmissions } from './collections/ContactSubmissions'
import { Pages } from './collections/Pages'

import { SiteSettings } from './globals/SiteSettings'
import { MainNav } from './globals/MainNav'
import { Footer } from './globals/Footer'

import { slugField } from './fields/slug'
import { seoFields } from './fields/seo'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
  serverURL: process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000',
  admin: {
    user: Users.slug,
    importMap: {
      baseDir: path.resolve(dirname),
    },
    components: {
      graphics: {
        Logo: '@/components/admin/AdminLogo',
        Icon: '@/components/admin/AdminIcon',
      },
      afterNavLinks: ['@/components/admin/SubmissionsBeforeList'],
      views: {
        formResponses: {
          Component: '@/components/admin/FormResponsesViewWrapper',
          path: '/form-responses',
        },
        publicForms: {
          Component: '@/components/admin/PublicFormsViewWrapper',
          path: '/public-forms',
        },
      },
    },
  },
  collections: [
    // Auth
    Users,
    // Assets
    Media,
    // Content
    Solutions,
    Services,
    Industries,
    Partners,
    Webinars,
    Team,
    // Admin
    ContactSubmissions,
    // Static pages
    Pages,
  ],
  globals: [
    SiteSettings,
    MainNav,
    Footer,
  ],
  editor: lexicalEditor(),
  secret: process.env.PAYLOAD_SECRET || '',
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  db: postgresAdapter({
    pool: {
      connectionString: process.env.DATABASE_URL || '',
    },
  }),
  sharp,
  plugins: [
    formBuilderPlugin({
      fields: {
        text: true,
        textarea: true,
        select: true,
        email: true,
        checkbox: true,
        number: true,
        message: true,
        payment: false,
        state: false,
        country: false,
      },
      formOverrides: {
        admin: {
          group: 'Forms',
          preview: (doc) => {
            const base = process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'
            return doc?.slug ? `${base}/forms/${doc.slug}` : null
          },
        },
        versions: { drafts: true },
        access: {
          read: ({ req }) => {
            if (req.user) return true
            return { _status: { equals: 'published' } }
          },
        },
        fields: ({ defaultFields }) => [
          ...defaultFields,
          slugField('title'),
          {
            name: 'description',
            type: 'textarea',
            admin: {
              description: 'Intro text shown above the form on the public page.',
            },
          },
          seoFields,
          {
            name: 'emailSettings',
            type: 'group',
            label: 'Email Notifications',
            admin: {
              description:
                'Configure automated emails sent when this form is submitted. Use {{fieldName}} in templates to insert submitted values, {{allFields}} for a full table, {{formTitle}} for the form name.',
            },
            fields: [
              {
                type: 'row',
                fields: [
                  {
                    name: 'sendConfirmationEmail',
                    type: 'checkbox',
                    label: 'Send confirmation email to submitter',
                    defaultValue: true,
                    admin: { width: '50%' },
                  },
                  {
                    name: 'sendNotificationEmail',
                    type: 'checkbox',
                    label: 'Send notification email to form owner',
                    defaultValue: true,
                    admin: { width: '50%' },
                  },
                ],
              },
              // ── Confirmation email ──────────────────────────────────────
              {
                name: 'submitterEmailField',
                type: 'text',
                label: 'Email field name',
                defaultValue: 'email',
                admin: {
                  description: "The name attribute of the field in this form that holds the submitter's email (default: \"email\").",
                  condition: (_data, siblingData) => Boolean(siblingData?.sendConfirmationEmail),
                },
              },
              {
                name: 'confirmationSubject',
                type: 'text',
                label: 'Confirmation email — subject',
                admin: {
                  placeholder: 'Thank you for your submission',
                  condition: (_data, siblingData) => Boolean(siblingData?.sendConfirmationEmail),
                },
              },
              {
                name: 'confirmationBody',
                type: 'textarea',
                label: 'Confirmation email — body (HTML)',
                admin: {
                  description: 'Leave blank to use the default template. Supports HTML.',
                  condition: (_data, siblingData) => Boolean(siblingData?.sendConfirmationEmail),
                },
              },
              // ── Notification email ──────────────────────────────────────
              {
                name: 'notifyTo',
                type: 'text',
                label: 'Notification — send to (email address)',
                admin: {
                  description: 'Comma-separated recipients. Leave blank to use the default MAIL_FROM address.',
                  condition: (_data, siblingData) => Boolean(siblingData?.sendNotificationEmail),
                },
              },
              {
                name: 'notificationSubject',
                type: 'text',
                label: 'Notification email — subject',
                admin: {
                  placeholder: 'New submission received',
                  condition: (_data, siblingData) => Boolean(siblingData?.sendNotificationEmail),
                },
              },
              {
                name: 'notificationBody',
                type: 'textarea',
                label: 'Notification email — body (HTML)',
                admin: {
                  description: 'Leave blank to use the default template. Supports HTML.',
                  condition: (_data, siblingData) => Boolean(siblingData?.sendNotificationEmail),
                },
              },
            ],
          },
        ],
      },
      formSubmissionOverrides: {
        hooks: {
          afterChange: [sendFormNotificationEmails],
        },
        admin: {
          group: 'Forms',
          defaultColumns: ['form', 'createdAt', 'viewResponses'],
          preview: (doc) => {
            const formId = typeof doc?.form === 'object' ? (doc.form as { id: string }).id : doc?.form
            const base = process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'
            return formId
              ? `${base}/admin/form-responses?formId=${formId}`
              : `${base}/admin/form-responses`
          },
        },
        fields: ({ defaultFields }) => [
          ...defaultFields,
          {
            name: 'viewResponses',
            type: 'ui',
            admin: {
              components: {
                Cell: '@/components/admin/ViewResponsesCell',
                Field: '@/components/admin/ViewResponsesCell',
              },
            },
          },
        ],
      },
      redirectRelationships: ['pages'],
    }),
  ],
})
