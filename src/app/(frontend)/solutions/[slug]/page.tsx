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
  const { docs } = await payload.find({ collection: 'solutions', where: { slug: { equals: slug } }, limit: 1 })
  const solution = docs[0]
  if (!solution) return {}
  return {
    title: solution.seo?.metaTitle ?? solution.title,
    description: solution.seo?.metaDescription ?? solution.shortDescription,
  }
}

export default async function SolutionDetailPage({ params }: Props) {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'solutions',
    where: { slug: { equals: slug } },
    depth: 2,
    limit: 1,
  })
  const solution = docs[0]
  if (!solution) notFound()

  return (
    <>
      {/* Page header with cover image */}
      <section className="page-header" style={{ position: 'relative', overflow: 'hidden' }}>
        {typeof solution.coverImage === 'object' && solution.coverImage?.url && (
          <div style={{
            position: 'absolute', inset: 0, zIndex: 0,
            background: 'linear-gradient(135deg, rgba(0,31,91,0.92), rgba(0,48,135,0.85))',
          }}>
            <PayloadImage
              image={solution.coverImage}
              style={{ width: '100%', height: '100%', objectFit: 'cover', opacity: 0.25 }}
            />
          </div>
        )}
        <div className="container" style={{ position: 'relative', zIndex: 1 }}>
          <div className="breadcrumb">
            <Link href="/">Home</Link> <span>/</span>
            <Link href="/solutions">Solutions</Link> <span>/</span>
            {solution.title}
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
            {typeof solution.icon === 'object' && solution.icon?.url && (
              <PayloadImage
                image={solution.icon}
                style={{ width: '56px', height: '56px', objectFit: 'contain', filter: 'brightness(10)' }}
              />
            )}
            <h1>{solution.title}</h1>
          </div>
          <p>{solution.shortDescription}</p>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <div className="detail-layout">
            {/* Main content */}
            <div>
              {solution.highlights && solution.highlights.length > 0 && (
                <div style={{ marginBottom: '40px' }}>
                  <h2 style={{ marginBottom: '20px' }}>Key Highlights</h2>
                  <ul className="highlights">
                    {solution.highlights.map((h, i) => (
                      <li key={i}>{h.point}</li>
                    ))}
                  </ul>
                </div>
              )}

              {typeof solution.coverImage === 'object' && solution.coverImage?.url && (
                <div style={{ marginBottom: '32px' }}>
                  <PayloadImage
                    image={solution.coverImage}
                    style={{ width: '100%', borderRadius: '8px', maxHeight: '400px', objectFit: 'cover' }}
                  />
                </div>
              )}

              {solution.description && (
                <div>
                  <h2 style={{ marginBottom: '16px' }}>Overview</h2>
                  <RichText content={solution.description as any} />
                </div>
              )}

              {Array.isArray(solution.industries) && solution.industries.length > 0 && (
                <div style={{ marginTop: '40px' }}>
                  <h2 style={{ marginBottom: '16px' }}>Applicable Industries</h2>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
                    {solution.industries.map((ind) => {
                      if (typeof ind === 'object' && ind !== null) {
                        return (
                          <Link key={ind.id} href={`/industries/${ind.slug}`} className="tag" style={{ fontSize: '0.9rem', padding: '6px 16px' }}>
                            {ind.title}
                          </Link>
                        )
                      }
                      return null
                    })}
                  </div>
                </div>
              )}
            </div>

            {/* Sidebar */}
            <aside>
              <div className="aside-card">
                <h3>Interested in this solution?</h3>
                <p style={{ fontSize: '0.88rem', marginBottom: '16px' }}>
                  Talk to our experts and find out how this solution fits your business.
                </p>
                <Link href="/contact-us" className="btn btn-primary" style={{ display: 'block', textAlign: 'center' }}>
                  Contact Us
                </Link>
                <Link href="/solutions" className="back-link" style={{ marginTop: '16px', display: 'inline-flex' }}>
                  ← All Solutions
                </Link>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </>
  )
}
