import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import PayloadImage from '@/components/PayloadImage'
import RichText from '@/components/RichText'

type Props = { params: Promise<{ slug: string }> }

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({ collection: 'services', where: { slug: { equals: slug } }, limit: 1 })
  const service = docs[0]
  if (!service) return {}
  return {
    title: service.seo?.metaTitle ?? service.title,
    description: service.seo?.metaDescription ?? service.shortDescription,
  }
}

export default async function ServiceDetailPage({ params }: Props) {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'services',
    where: { slug: { equals: slug } },
    depth: 2,
    limit: 1,
  })
  const service = docs[0]
  if (!service) notFound()

  return (
    <>
      {/* ── Page Header ── */}
      <section className="page-header" style={{ position: 'relative', overflow: 'hidden' }}>
        {typeof service.coverImage === 'object' && service.coverImage?.url && (
          <div style={{ position: 'absolute', inset: 0, zIndex: 0 }}>
            <PayloadImage
              image={service.coverImage}
              style={{ width: '100%', height: '100%', objectFit: 'cover', opacity: 0.15 }}
            />
          </div>
        )}
        <div className="container" style={{ position: 'relative', zIndex: 1 }}>
          <div className="breadcrumb">
            <Link href="/">Home</Link> <span>/</span>
            <Link href="/services">Services</Link> <span>/</span>
            <span style={{ color: '#fff' }}>{service.title}</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '16px', marginTop: '8px' }}>
            {typeof service.icon === 'object' && service.icon?.url && (
              <div style={{
                background: 'rgba(255,255,255,0.1)', borderRadius: '12px',
                padding: '12px', flexShrink: 0,
              }}>
                <PayloadImage
                  image={service.icon}
                  style={{ width: '48px', height: '48px', objectFit: 'contain', filter: 'brightness(10)' }}
                />
              </div>
            )}
            <h1>{service.title}</h1>
          </div>
          {service.shortDescription && (
            <p style={{ marginTop: '16px', maxWidth: '640px' }}>{service.shortDescription}</p>
          )}
        </div>
      </section>

      {/* ── Body ── */}
      <section className="section">
        <div className="container">
          <div className="detail-layout">

            {/* ── Main Content ── */}
            <div>
              {/* Highlights */}
              {service.highlights && service.highlights.length > 0 && (
                <div style={{ marginBottom: '40px' }}>
                  <h2 style={{ marginBottom: '20px' }}>Key Highlights</h2>
                  <ul className="highlights">
                    {service.highlights.map((h, i) => (
                      <li key={i}>{h.point}</li>
                    ))}
                  </ul>
                </div>
              )}

              {/* Cover image in body */}
              {typeof service.coverImage === 'object' && service.coverImage?.url && (
                <div style={{ marginBottom: '36px' }}>
                  <PayloadImage
                    image={service.coverImage}
                    style={{ width: '100%', borderRadius: '8px', maxHeight: '420px', objectFit: 'cover' }}
                  />
                </div>
              )}

              {/* Rich text overview */}
              {service.description && (
                <div style={{ marginBottom: '40px' }}>
                  <h2 style={{ marginBottom: '16px' }}>Overview</h2>
                  <div className="rich-text">
                    <RichText content={service.description as any} />
                  </div>
                </div>
              )}

              {/* Related solutions */}
              {Array.isArray(service.relatedSolutions) && service.relatedSolutions.length > 0 && (
                <div>
                  <h2 style={{ marginBottom: '20px' }}>Related Solutions</h2>
                  <div className="card-grid card-grid--2">
                    {service.relatedSolutions.map((sol) => {
                      if (typeof sol === 'object' && sol !== null) {
                        return (
                          <Link key={sol.id} href={`/solutions/${sol.slug}`} className="card">
                            <div className="card__title">{sol.title}</div>
                            {sol.shortDescription && (
                              <p className="card__desc">{sol.shortDescription}</p>
                            )}
                            <span className="card__link">Learn more →</span>
                          </Link>
                        )
                      }
                      return null
                    })}
                  </div>
                </div>
              )}
            </div>

            {/* ── Sidebar ── */}
            <aside>
              <div className="aside-card" style={{ position: 'sticky', top: 'calc(var(--nav-h) + 24px)' }}>
                <h3>Interested in this service?</h3>
                <p style={{ fontSize: '0.88rem', color: 'var(--text-muted)', marginBottom: '20px' }}>
                  Talk to our experts and get a tailored proposal for your business needs.
                </p>
                <Link
                  href="/contact-us"
                  className="btn btn-primary"
                  style={{ display: 'block', textAlign: 'center', marginBottom: '10px' }}
                >
                  Get a Free Consultation
                </Link>
                <Link
                  href="/solutions"
                  className="btn btn-blue btn-sm"
                  style={{ display: 'block', textAlign: 'center', marginBottom: '20px' }}
                >
                  Browse Solutions
                </Link>

                <hr style={{ border: 'none', borderTop: '1px solid var(--border)', margin: '0 0 16px' }} />

                <Link href="/services" className="back-link">
                  ← All Services
                </Link>
              </div>
            </aside>

          </div>
        </div>
      </section>

      {/* ── CTA ── */}
      <section className="cta-band">
        <div className="container">
          <h2>Ready to Get Started?</h2>
          <p>Let's talk about how {service.title} can drive growth for your business.</p>
          <div className="cta-band__actions">
            <Link href="/contact-us" className="btn btn-primary">Contact Us</Link>
            <Link href="/services" className="btn btn-outline">All Services</Link>
          </div>
        </div>
      </section>
    </>
  )
}
