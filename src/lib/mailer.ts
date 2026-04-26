import nodemailer from 'nodemailer'

export const transporter = nodemailer.createTransport({
  host: process.env.MAIL_HOST || 'mail2.cloudaccess.net',
  port: Number(process.env.MAIL_PORT) || 587,
  secure: false,
  auth: {
    user: process.env.MAIL_USER,
    pass: process.env.MAIL_PASS,
  },
  requireTLS: true,
  tls: {
    rejectUnauthorized: false,
  },
})

export const mailFrom = `"${process.env.MAIL_FROM_NAME || 'Swajyot'}" <${process.env.MAIL_FROM || process.env.MAIL_USER}>`
