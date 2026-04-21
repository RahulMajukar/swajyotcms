import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'
import PayloadImage from '@/components/PayloadImage'

export const metadata = {
  title: 'Our Services',
  description: 'Software Development, Analytics Outsourcing, UI/UX Design and more technology services.',
}

const SERVICE_ICONS: Record<string, string> = {
  default: '⚙️',
}

export default async function ServicesPage() {
  const payload = await getPayload({ config: configPromise })
  const { docs: services } = await payload.find({
    collection: 'services',
    where: { _status: { equals: 'published' } },
    sort: 'title',
    depth: 1,
  })

  return (
    <>
      {/* ── Page Header ── */}
      <section className="page-header">
        <div className="container">
          <div className="breadcrumb">
            <Link href="/">Home</Link> <span>/</span> Services
          </div>
          <p className="section-label">What We Do</p>
          <h1>Our Services</h1>
          <p style={{ maxWidth: '640px', marginTop: '12px' }}>
            We deliver best-in-class technology services tailored to your business environment,
            from software development to analytics outsourcing.
          </p>
        </div>
      </section>

      {/* ── Services Grid ── */}
      <section className="section">
        <div className="container">
          {services.length === 0 ? (
            <p style={{ color: 'var(--text-muted)' }}>Services coming soon.</p>
          ) : (
            <div className="card-grid card-grid--3">
              {services.map((s) => (
                <Link key={s.id} href={`/services/${s.slug}`} className="card">
                  {typeof s.icon === 'object' && s.icon?.url ? (
                    <div className="card__icon">
                      <PayloadImage
                        image={s.icon}
                        style={{ width: '48px', height: '48px', objectFit: 'contain' }}
                      />
                    </div>
                  ) : (
                    <div className="card__icon">{SERVICE_ICONS.default}</div>
                  )}
                  <div className="card__title">{s.title}</div>
                  {s.shortDescription && (
                    <p className="card__desc">{s.shortDescription}</p>
                  )}
                  <span className="card__link">Learn more →</span>
                </Link>
              ))}
            </div>
          )}
        </div>
      </section>

      {/* ── CTA ── */}
      <section className="cta-band">
        <div className="container">
          <h2>Need a Custom Solution?</h2>
          <p>Tell us about your project and we'll tailor the right service for you.</p>
          <div className="cta-band__actions">
            <Link href="/contact-us" className="btn btn-primary">Get in Touch</Link>
            <Link href="/solutions" className="btn btn-outline">Explore Solutions</Link>
          </div>
        </div>
      </section>
    </>
  )
}
