import { getPayload } from 'payload'
import configPromise from '@payload-config'
import type { Metadata } from 'next'
import Link from 'next/link'
import PayloadImage from '@/components/PayloadImage'

export const metadata: Metadata = {
  title: 'About Us',
  description: 'Over 10 years helping companies reach their financial and branding goals through digital transformation.',
}

export default async function AboutPage() {
  const payload = await getPayload({ config: configPromise })
  const [settings, teamResult] = await Promise.all([
    payload.findGlobal({ slug: 'site-settings' }),
    payload.find({ collection: 'team', sort: 'order', limit: 50, depth: 1 }),
  ])

  return (
    <>
      <section className="page-header">
        <div className="container">
          <div className="breadcrumb"><a href="/">Home</a> <span>/</span> About Us</div>
          <h1>About {settings.companyName}</h1>
          <p>Understanding Customer needs &amp; Delivering the best-in-class Solutions.</p>
        </div>
      </section>

      {/* Story */}
      <section className="section">
        <div className="container">
          <div style={{ maxWidth: '780px' }}>
            <p className="section-label">Our Story</p>
            <h2 className="section-title">Always Creating Value</h2>
            <p style={{ fontSize: '1.05rem', lineHeight: '1.85', color: 'var(--text)' }}>
              Swajyot Technologies has been helping enterprises gain competitive advantages and
              sustain growth for over 10 years. Our focus is on understanding customer needs and
              delivering best-in-class solutions across Analytics &amp; AI, Digital Process
              Automation, Enterprise Quality Management, and more.
            </p>
            <p style={{ fontSize: '1.05rem', lineHeight: '1.85', color: 'var(--text)' }}>
              We believe that systems must adapt to the customer&apos;s environment and serve their
              intended purpose — and beyond. This philosophy drives everything we build.
            </p>
          </div>
        </div>
      </section>

      {/* Philosophy */}
      <section className="section section--soft">
        <div className="container">
          <p className="section-label">Our Philosophy</p>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '24px', marginTop: '32px' }}>
            {[
              { title: 'Customer First', desc: 'Understanding customer needs and delivering solutions that truly serve their intended purpose — and beyond.' },
              { title: 'Adaptability', desc: 'Systems we build must adapt to the customer\'s environment, not the other way around.' },
              { title: 'Value Creation', desc: 'Every engagement is designed to create measurable, sustainable business value for our clients.' },
            ].map((item) => (
              <div key={item.title} className="card">
                <div className="card__title">{item.title}</div>
                <p className="card__desc">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Industries */}
      <section className="section">
        <div className="container">
          <p className="section-label">Who We Serve</p>
          <h2 className="section-title">Industries We Serve</h2>
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: '12px', marginTop: '24px' }}>
            {['General Manufacturing', 'Pharmaceuticals & Life Sciences', 'Healthcare', 'Energy & Resources'].map((ind) => (
              <span key={ind} className="tag" style={{ fontSize: '0.95rem', padding: '8px 18px' }}>{ind}</span>
            ))}
          </div>
        </div>
      </section>

      {/* Team */}
      {teamResult.docs.length > 0 && (
        <section className="section section--soft">
          <div className="container">
            <p className="section-label">The People</p>
            <h2 className="section-title">Our Team</h2>
            <div className="card-grid card-grid--4" style={{ marginTop: '32px' }}>
              {teamResult.docs.map((member) => (
                <div key={member.id} className="card team-card">
                  {typeof member.photo === 'object' && member.photo?.url ? (
                    <PayloadImage
                      image={member.photo}
                      style={{ width: '90px', height: '90px', borderRadius: '50%', objectFit: 'cover', margin: '0 auto 14px' }}
                    />
                  ) : (
                    <div className="team-card__avatar">
                      {member.name.charAt(0).toUpperCase()}
                    </div>
                  )}
                  <div className="team-card__name">{member.name}</div>
                  <div className="team-card__role">{member.role}</div>
                  {member.bio && <p className="card__desc" style={{ marginTop: '10px', textAlign: 'left' }}>{member.bio}</p>}
                  {member.linkedIn && (
                    <a href={member.linkedIn} target="_blank" rel="noopener noreferrer" className="card__link" style={{ marginTop: '10px' }}>
                      LinkedIn →
                    </a>
                  )}
                </div>
              ))}
            </div>
          </div>
        </section>
      )}

      {/* Contact CTA */}
      <section className="cta-band">
        <div className="container">
          <h2>Let&apos;s Work Together</h2>
          <p>Ready to start your digital transformation journey?</p>
          <div className="cta-band__actions">
            <Link href="/contact-us" className="btn btn-primary">Get In Touch</Link>
            <Link href="/solutions" className="btn btn-outline">Our Solutions</Link>
          </div>
        </div>
      </section>
    </>
  )
}
