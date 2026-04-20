import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Webinars',
  description: 'Upcoming and past webinars from Swajyot Technologies on Analytics, Process Excellence, and Digital Transformation.',
}

const STATUS_CLASS: Record<string, string> = {
  upcoming:     'status-badge--upcoming',
  live:         'status-badge--live',
  past:         'status-badge--past',
  'coming-soon':'status-badge--past',
}

export default async function WebinarsPage() {
  const payload = await getPayload({ config: configPromise })
  const { docs: webinars } = await payload.find({
    collection: 'webinars',
    where: { _status: { equals: 'published' } },
    sort: '-date',
    limit: 50,
  })

  const upcoming = webinars.filter((w) => w.eventStatus === 'upcoming' || w.eventStatus === 'live' || w.eventStatus === 'coming-soon')
  const past     = webinars.filter((w) => w.eventStatus === 'past')

  return (
    <>
      <section className="page-header">
        <div className="container">
          <div className="breadcrumb"><a href="/">Home</a> <span>/</span> Explore <span>/</span> Webinars</div>
          <h1>Webinars</h1>
          <p>Join our webinars to learn about Analytics, Process Excellence, and Digital Transformation.</p>
        </div>
      </section>

      {webinars.length === 0 ? (
        <section className="section"><div className="container"><p>Webinars coming soon. Check back shortly.</p></div></section>
      ) : (
        <>
          {upcoming.length > 0 && (
            <section className="section">
              <div className="container">
                <h2 className="section-title">Upcoming Webinars</h2>
                <div className="card-grid card-grid--3" style={{ marginTop: '32px' }}>
                  {upcoming.map((w) => (
                    <div key={w.id} className="card webinar-card">
                      <span className={`status-badge ${STATUS_CLASS[w.eventStatus ?? 'upcoming']}`}>
                        {w.eventStatus?.replace('-', ' ')}
                      </span>
                      {w.date && (
                        <div className="webinar-date">
                          📅 <time dateTime={w.date}>{new Date(w.date).toLocaleDateString('en-IN', { dateStyle: 'long' })}</time>
                        </div>
                      )}
                      <div className="card__title">{w.title}</div>
                      <p className="card__desc">{w.shortDescription}</p>
                      <div style={{ display: 'flex', gap: '10px', flexWrap: 'wrap' }}>
                        <Link href={`/explore/webinars/${w.slug}`} className="card__link">Details →</Link>
                        {w.registrationUrl && (
                          <a href={w.registrationUrl} target="_blank" rel="noopener noreferrer" className="btn btn-primary btn-sm">
                            Register
                          </a>
                        )}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </section>
          )}

          {past.length > 0 && (
            <section className="section section--soft">
              <div className="container">
                <h2 className="section-title">Past Webinars</h2>
                <div className="card-grid card-grid--3" style={{ marginTop: '32px' }}>
                  {past.map((w) => (
                    <Link key={w.id} href={`/explore/webinars/${w.slug}`} className="card webinar-card">
                      <span className="status-badge status-badge--past">Past</span>
                      {w.date && (
                        <div className="webinar-date">
                          📅 <time dateTime={w.date}>{new Date(w.date).toLocaleDateString('en-IN', { dateStyle: 'long' })}</time>
                        </div>
                      )}
                      <div className="card__title">{w.title}</div>
                      <p className="card__desc">{w.shortDescription}</p>
                      <span className="card__link">Watch recording →</span>
                    </Link>
                  ))}
                </div>
              </div>
            </section>
          )}
        </>
      )}
    </>
  )
}
