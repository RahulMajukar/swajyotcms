import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'

type Props = { params: Promise<{ slug: string }> }

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'webinars',
    where: { slug: { equals: slug } },
    limit: 1,
  })
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
    depth: 1,
    limit: 1,
  })
  const webinar = docs[0]
  if (!webinar) notFound()

  return (
    <>
      <nav>
        <Link href="/explore/webinars">← All Webinars</Link>
      </nav>

      <article>
        <header>
          <span>{webinar.eventStatus}</span>
          <h1>{webinar.title}</h1>
          {webinar.date && (
            <time dateTime={webinar.date}>
              {new Date(webinar.date).toLocaleDateString('en-IN', { dateStyle: 'long' })}
            </time>
          )}
          <p>{webinar.shortDescription}</p>
        </header>

        {webinar.registrationUrl && webinar.eventStatus !== 'past' && (
          <a href={webinar.registrationUrl} target="_blank" rel="noopener noreferrer">
            Register Now
          </a>
        )}

        {webinar.recordingUrl && (
          <a href={webinar.recordingUrl} target="_blank" rel="noopener noreferrer">
            Watch Recording
          </a>
        )}

        {webinar.description && (
          <section>
            <div data-rich-text>{JSON.stringify(webinar.description)}</div>
          </section>
        )}

        {webinar.speakers && webinar.speakers.length > 0 && (
          <section>
            <h2>Speakers</h2>
            <ul>
              {webinar.speakers.map((s, i) => (
                <li key={i}>
                  <strong>{s.name}</strong>
                  {s.role && <span> — {s.role}</span>}
                </li>
              ))}
            </ul>
          </section>
        )}

        {typeof webinar.partner === 'object' && webinar.partner !== null && (
          <section>
            <p>
              In partnership with{' '}
              <Link href={`/explore/partners/${webinar.partner.slug}`}>
                {webinar.partner.name}
              </Link>
            </p>
          </section>
        )}
      </article>
    </>
  )
}
