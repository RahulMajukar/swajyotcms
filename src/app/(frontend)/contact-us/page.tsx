import { getPayload } from 'payload'
import configPromise from '@payload-config'
import { redirect } from 'next/navigation'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Contact Us',
  description: 'Get in touch with Swajyot Technologies. We respond within one business day.',
}

async function submitContact(formData: FormData) {
  'use server'
  const payload = await getPayload({ config: configPromise })
  await payload.create({
    collection: 'contact-submissions',
    data: {
      name:    formData.get('name')    as string,
      email:   formData.get('email')   as string,
      phone:   formData.get('phone')   as string,
      company: formData.get('company') as string,
      subject: formData.get('subject') as string,
      message: formData.get('message') as string,
    },
  })
  redirect('/contact-us?sent=1')
}

export default async function ContactPage({
  searchParams,
}: {
  searchParams: Promise<{ sent?: string }>
}) {
  const params = await searchParams
  const payload = await getPayload({ config: configPromise })
  const settings = await payload.findGlobal({ slug: 'site-settings' })

  return (
    <>
      {/* Page header */}
      <section className="page-header">
        <div className="container">
          <div className="breadcrumb">
            <a href="/">Home</a> <span>/</span> Contact Us
          </div>
          <h1>Contact Us</h1>
          <p>Reach out to us and we&apos;ll get back to you within one business day.</p>
        </div>
      </section>

      {/* Content */}
      <section className="section">
        <div className="container">
          <div className="contact-grid">
            {/* Info */}
            <div>
              <h2 style={{ marginBottom: '28px' }}>Get In Touch</h2>

              <div className="contact-info__item">
                <div className="contact-info__icon">📧</div>
                <div>
                  <div className="contact-info__label">Email</div>
                  <div className="contact-info__value">
                    <a href={`mailto:${settings.email}`}>{settings.email}</a>
                  </div>
                </div>
              </div>

              <div className="contact-info__item">
                <div className="contact-info__icon">📞</div>
                <div>
                  <div className="contact-info__label">Phone</div>
                  <div className="contact-info__value">{settings.phone}</div>
                </div>
              </div>

              {settings.address && (
                <div className="contact-info__item">
                  <div className="contact-info__icon">📍</div>
                  <div>
                    <div className="contact-info__label">Office Address</div>
                    <div className="contact-info__value" style={{ fontWeight: 400, lineHeight: '1.7' }}>
                      {settings.address.line1}<br />
                      {settings.address.line2 && <>{settings.address.line2}<br /></>}
                      {settings.address.city}, {settings.address.state} – {settings.address.pincode}<br />
                      {settings.address.country}
                    </div>
                  </div>
                </div>
              )}

              {settings.officeHours && settings.officeHours.length > 0 && (
                <div className="contact-hours">
                  <h3>Office Hours</h3>
                  {settings.officeHours.map((h, i) => (
                    <div key={i} className="contact-hours-row">
                      <span>{h.days}</span>
                      <span>{h.hours}</span>
                    </div>
                  ))}
                </div>
              )}
            </div>

            {/* Form */}
            <div className="form-card">
              <h2 style={{ marginBottom: '24px', fontSize: '1.3rem' }}>Send Us a Message</h2>
              {params.sent === '1' ? (
                <div className="form-success">
                  ✅ Thank you! Your message has been received. We&apos;ll be in touch shortly.
                </div>
              ) : (
                <form action={submitContact}>
                  <div className="form-grid">
                    <div className="form-group">
                      <label htmlFor="name">Full Name *</label>
                      <input id="name" name="name" type="text" required placeholder="John Doe" />
                    </div>
                    <div className="form-group">
                      <label htmlFor="email">Email *</label>
                      <input id="email" name="email" type="email" required placeholder="john@company.com" />
                    </div>
                    <div className="form-group">
                      <label htmlFor="phone">Phone</label>
                      <input id="phone" name="phone" type="tel" placeholder="+91 98765 43210" />
                    </div>
                    <div className="form-group">
                      <label htmlFor="company">Company</label>
                      <input id="company" name="company" type="text" placeholder="Your Company" />
                    </div>
                    <div className="form-group form-group--full">
                      <label htmlFor="subject">Subject</label>
                      <input id="subject" name="subject" type="text" placeholder="How can we help?" />
                    </div>
                    <div className="form-group form-group--full">
                      <label htmlFor="message">Message *</label>
                      <textarea id="message" name="message" rows={5} required placeholder="Tell us about your requirements..." />
                    </div>
                  </div>
                  <div style={{ marginTop: '20px' }}>
                    <button type="submit" className="btn btn-primary" style={{ width: '100%', justifyContent: 'center' }}>
                      Send Message →
                    </button>
                  </div>
                </form>
              )}
            </div>
          </div>
        </div>
      </section>
    </>
  )
}
