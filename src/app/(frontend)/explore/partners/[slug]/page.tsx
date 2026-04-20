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
  const { docs } = await payload.find({ collection: 'partners', where: { slug: { equals: slug } }, limit: 1 })
  const partner = docs[0]
  if (!partner) return {}
  return {
    title: partner.seo?.metaTitle ?? partner.name,
    description: partner.seo?.metaDescription ?? partner.description ?? undefined,
  }
}

export default async function PartnerDetailPage({ params }: Props) {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'partners',
    where: { slug: { equals: slug } },
    depth: 2,
    limit: 1,
  })
  const partner = docs[0]
  if (!partner) notFound()

  return (
    <>
      <section className="page-header">
        <div className="container">
          <div className="breadcrumb">
            <Link href="/">Home</Link> <span>/</span>
            <Link href="/explore/partners">Partners</Link> <span>/</span>
            {partner.name}
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '24px', flexWrap: 'wrap' }}>
            {typeof partner.logo === 'object' && partner.logo?.url && (
              <div style={{
                background: '#fff', borderRadius: '8px', padding: '12px 20px',
                display: 'flex', alignItems: 'center',
              }}>
                <PayloadImage
                  image={partner.logo}
                  style={{ height: '48px', width: 'auto', objectFit: 'contain' }}
                />
              </div>
            )}
            <h1>{partner.name}</h1>
          </div>
          {partner.description && <p>{partner.description}</p>}
        </div>
      </section>

      <section className="section">
        <div className="container">
          <div className="detail-layout">
            <div>
              {partner.detailContent && (
                <div>
                  <RichText content={partner.detailContent as any} />
                </div>
              )}

              {Array.isArray(partner.featuredSolutions) && partner.featuredSolutions.length > 0 && (
                <div style={{ marginTop: '40px' }}>
                  <h2 style={{ marginBottom: '20px' }}>Solutions Powered by {partner.name}</h2>
                  <div className="card-grid card-grid--2">
                    {partner.featuredSolutions.map((sol) => {
                      if (typeof sol === 'object' && sol !== null) {
                        return (
                          <Link key={sol.id} href={`/solutions/${sol.slug}`} className="card">
                            <div className="card__title">{sol.title}</div>
                            <p className="card__desc">{sol.shortDescription}</p>
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
                {typeof partner.logo === 'object' && partner.logo?.url && (
                  <div style={{ marginBottom: '20px', textAlign: 'center' }}>
                    <PayloadImage
                      image={partner.logo}
                      style={{ maxHeight: '60px', maxWidth: '160px', objectFit: 'contain', margin: '0 auto' }}
                    />
                  </div>
                )}
                <h3>{partner.name}</h3>
                {partner.website && (
                  <a
                    href={partner.website}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="btn btn-blue btn-sm"
                    style={{ display: 'block', textAlign: 'center', marginBottom: '12px' }}
                  >
                    Visit Website ↗
                  </a>
                )}
                <Link href="/contact-us" className="btn btn-primary btn-sm" style={{ display: 'block', textAlign: 'center' }}>
                  Get a Demo
                </Link>
                <Link href="/explore/partners" className="back-link" style={{ marginTop: '16px', display: 'inline-flex' }}>
                  ← All Partners
                </Link>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </>
  )
}
