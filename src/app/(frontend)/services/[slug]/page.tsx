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
      <section className="page-header" style={{ position: 'relative', overflow: 'hidden' }}>
        {typeof service.coverImage === 'object' && service.coverImage?.url && (
          <div style={{ position: 'absolute', inset: 0, zIndex: 0 }}>
            <PayloadImage
              image={service.coverImage}
              style={{ width: '100%', height: '100%', objectFit: 'cover', opacity: 0.2 }}
            />
          </div>
        )}
        <div className="container" style={{ position: 'relative', zIndex: 1 }}>
          <div className="breadcrumb">
            <Link href="/">Home</Link> <span>/</span>
            <Link href="/services">Services</Link> <span>/</span>
            {service.title}
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
            {typeof service.icon === 'object' && service.icon?.url && (
              <PayloadImage
                image={service.icon}
                style={{ width: '56px', height: '56px', objectFit: 'contain', filter: 'brightness(10)' }}
              />
            )}
            <h1>{service.title}</h1>
          </div>
          <p>{service.shortDescription}</p>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <div className="detail-layout">
            <div>
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

              {typeof service.coverImage === 'object' && service.coverImage?.url && (
                <div style={{ marginBottom: '32px' }}>
                  <PayloadImage
                    image={service.coverImage}
                    style={{ width: '100%', borderRadius: '8px', maxHeight: '400px', objectFit: 'cover' }}
                  />
                </div>
              )}

              {service.description && (
                <div>
                  <h2 style={{ marginBottom: '16px' }}>Overview</h2>
                  <RichText content={service.description as any} />
                </div>
              )}

              {Array.isArray(service.relatedSolutions) && service.relatedSolutions.length > 0 && (
                <div style={{ marginTop: '40px' }}>
                  <h2 style={{ marginBottom: '16px' }}>Related Solutions</h2>
                  <div className="card-grid card-grid--2">
                    {service.relatedSolutions.map((sol) => {
                      if (typeof sol === 'object' && sol !== null) {
                        return (
                          <Link key={sol.id} href={`/solutions/${sol.slug}`} className="card">
                            <div className="card__title">{sol.title}</div>
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

            <aside>
              <div className="aside-card">
                <h3>Interested in this service?</h3>
                <p style={{ fontSize: '0.88rem', marginBottom: '16px' }}>
                  Talk to our experts and get a tailored proposal for your business.
                </p>
                <Link href="/contact-us" className="btn btn-primary" style={{ display: 'block', textAlign: 'center' }}>
                  Contact Us
                </Link>
                <Link href="/services" className="back-link" style={{ marginTop: '16px', display: 'inline-flex' }}>
                  ← All Services
                </Link>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </>
  )
}
