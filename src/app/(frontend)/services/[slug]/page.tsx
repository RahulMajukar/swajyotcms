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
    collection: 'services',
    where: { slug: { equals: slug } },
    limit: 1,
  })
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
    depth: 1,
    limit: 1,
  })
  const service = docs[0]
  if (!service) notFound()

  return (
    <>
      <nav>
        <Link href="/services">← All Services</Link>
      </nav>

      <article>
        <header>
          <h1>{service.title}</h1>
          <p>{service.shortDescription}</p>
        </header>

        {service.highlights && service.highlights.length > 0 && (
          <section>
            <h2>Key Highlights</h2>
            <ul>
              {service.highlights.map((h, i) => (
                <li key={i}>{h.point}</li>
              ))}
            </ul>
          </section>
        )}

        {service.description && (
          <section>
            <div data-rich-text>{JSON.stringify(service.description)}</div>
          </section>
        )}

        {Array.isArray(service.relatedSolutions) && service.relatedSolutions.length > 0 && (
          <section>
            <h2>Related Solutions</h2>
            <ul>
              {service.relatedSolutions.map((sol) => {
                if (typeof sol === 'object' && sol !== null) {
                  return (
                    <li key={sol.id}>
                      <Link href={`/solutions/${sol.slug}`}>{sol.title}</Link>
                    </li>
                  )
                }
                return null
              })}
            </ul>
          </section>
        )}
      </article>

      <aside>
        <h2>Interested in this service?</h2>
        <Link href="/contact-us">Contact Us</Link>
      </aside>
    </>
  )
}
