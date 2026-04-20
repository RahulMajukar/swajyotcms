import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import PayloadImage from '@/components/PayloadImage'
import RichText from '@/components/RichText'

type Props = { params: Promise<{ slug: string }> }

const STATUS_CLASS: Record<string, string> = {
  upcoming:      'status-badge--upcoming',
  live:          'status-badge--live',
  past:          'status-badge--past',
  'coming-soon': 'status-badge--past',
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({ collection: 'webinars', where: { slug: { equals: slug } }, limit: 1 })
  const webinar = docs[0]
  if (!webinar) return {}
  return {
    title: webinar.seo?.metaTitle ?? webinar.title,
    description: webinar.seo?.metaDescription ?? webinar.shortDescription,
  }
}

export default async function WebinarDetailPage({ params }: Props) {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'webinars',
    where: { slug: { equals: slug } },
    depth: 2,
    limit: 1,
  })
  const webinar = docs[0]
  if (!webinar) notFound()

  const status = webinar.eventStatus ?? 'upcoming'

  return (
    <>
      <section className="page-header" style={{ position: 'relative', overflow: 'hidden' }}>
        {typeof webinar.coverImage === 'object' && webinar.coverImage?.url && (
          <div style={{ position: 'absolute', inset: 0, zIndex: 0 }}>
            <PayloadImage
              image={webinar.coverImage}
              style={{ width: '100%', height: '100%', objectFit: 'cover', opacity: 0.2 }}
            />
          </div>
        )}
        <div className="container" style={{ position: 'relative', zIndex: 1 }}>
          <div className="breadcrumb">
            <Link href="/">Home</Link> <span>/</span>
            <Link href="/explore/webinars">Webinars</Link> <span>/</span>
            {webinar.title}
          </div>
          <span className={`status-badge ${STATUS_CLASS[status]}`} style={{ marginBottom: '16px', display: 'inline-block' }}>
            {status.replace('-', ' ')}
          </span>
          <h1>{webinar.title}</h1>
          {webinar.date && (
            <p style={{ color: '#94adc4', marginBottom: '8px' }}>
              📅{' '}
              <time dateTime={webinar.date}>
                {new Date(webinar.date).toLocaleDateString('en-IN', { dateStyle: 'long' })}
              </time>
            </p>
          )}
          <p>{webinar.shortDescription}</p>
          <div style={{ display: 'flex', gap: '12px', flexWrap: 'wrap', marginTop: '8px' }}>
            {webinar.registrationUrl && status !== 'past' && (
              <a href={webinar.registrationUrl} target="_blank" rel="noopener noreferrer" className="btn btn-primary">
                Register Now
              </a>
            )}
            {webinar.recordingUrl && (
              <a href={webinar.recordingUrl} target="_blank" rel="noopener noreferrer" className="btn btn-outline">
                Watch Recording
              </a>
            )}
          </div>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <div className="detail-layout">
            <div>
              {typeof webinar.coverImage === 'object' && webinar.coverImage?.url && (
                <div style={{ marginBottom: '32px' }}>
                  <PayloadImage
                    image={webinar.coverImage}
                    style={{ width: '100%', borderRadius: '8px', maxHeight: '380px', objectFit: 'cover' }}
                  />
                </div>
              )}

              {webinar.description && (
                <div style={{ marginBottom: '32px' }}>
                  <h2 style={{ marginBottom: '16px' }}>About This Webinar</h2>
                  <RichText content={webinar.description as any} />
                </div>
              )}

              {webinar.speakers && webinar.speakers.length > 0 && (
                <div>
                  <h2 style={{ marginBottom: '20px' }}>Speakers</h2>
                  <div className="card-grid card-grid--2">
                    {webinar.speakers.map((s, i) => (
                      <div key={i} className="card" style={{ flexDirection: 'row', alignItems: 'center', gap: '16px' }}>
                        {typeof s.photo === 'object' && s.photo?.url ? (
                          <PayloadImage
                            image={s.photo}
                            style={{ width: '56px', height: '56px', borderRadius: '50%', objectFit: 'cover', flexShrink: 0 }}
                          />
                        ) : (
                          <div style={{
                            width: '56px', height: '56px', borderRadius: '50%',
                            background: 'var(--primary)', color: '#fff',
                            display: 'flex', alignItems: 'center', justifyContent: 'center',
                            fontWeight: 700, fontSize: '1.2rem', flexShrink: 0,
                          }}>
                            {s.name.charAt(0)}
                          </div>
                        )}
                        <div>
                          <div className="card__title" style={{ marginBottom: '2px' }}>{s.name}</div>
                          {s.role && <div style={{ fontSize: '0.85rem', color: 'var(--text-muted)' }}>{s.role}</div>}
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>

            <aside>
              <div className="aside-card">
                {webinar.date && (
                  <div style={{ marginBottom: '16px' }}>
                    <div style={{ fontSize: '0.75rem', fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.08em', color: 'var(--text-muted)', marginBottom: '4px' }}>Date</div>
                    <div style={{ fontWeight: 600 }}>
                      {new Date(webinar.date).toLocaleDateString('en-IN', { dateStyle: 'long' })}
                    </div>
                  </div>
                )}

                {typeof webinar.partner === 'object' && webinar.partner !== null && (
                  <div style={{ marginBottom: '20px' }}>
                    <div style={{ fontSize: '0.75rem', fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.08em', color: 'var(--text-muted)', marginBottom: '4px' }}>In Partnership With</div>
                    <Link href={`/explore/partners/${webinar.partner.slug}`} className="card__link">
                      {webinar.partner.name} →
                    </Link>
                  </div>
                )}

                {webinar.registrationUrl && status !== 'past' && (
                  <a href={webinar.registrationUrl} target="_blank" rel="noopener noreferrer" className="btn btn-primary" style={{ display: 'block', textAlign: 'center', marginBottom: '10px' }}>
                    Register Now
                  </a>
                )}
                {webinar.recordingUrl && (
                  <a href={webinar.recordingUrl} target="_blank" rel="noopener noreferrer" className="btn btn-blue" style={{ display: 'block', textAlign: 'center', marginBottom: '10px' }}>
                    Watch Recording
                  </a>
                )}
                <Link href="/explore/webinars" className="back-link" style={{ marginTop: '8px', display: 'inline-flex' }}>
                  ← All Webinars
                </Link>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </>
  )
}
