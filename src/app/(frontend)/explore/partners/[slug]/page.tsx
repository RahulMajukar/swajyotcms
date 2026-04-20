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
    collection: 'partners',
    where: { slug: { equals: slug } },
    limit: 1,
  })
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
    depth: 1,
    limit: 1,
  })
  const partner = docs[0]
  if (!partner) notFound()

  return (
    <>
      <nav>
        <Link href="/explore/partners">← All Partners</Link>
      </nav>

      <article>
        <header>
          <h1>{partner.name}</h1>
          {partner.description && <p>{partner.description}</p>}
          {partner.website && (
            <a href={partner.website} target="_blank" rel="noopener noreferrer">
              Visit Website
            </a>
          )}
        </header>

        {partner.detailContent && (
          <section>
            <div data-rich-text>{JSON.stringify(partner.detailContent)}</div>
          </section>
        )}

        {Array.isArray(partner.featuredSolutions) && partner.featuredSolutions.length > 0 && (
          <section>
            <h2>Solutions Powered by {partner.name}</h2>
            <ul>
              {partner.featuredSolutions.map((sol) => {
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
        <Link href="/contact-us">Get a Demo</Link>
      </aside>
    </>
  )
}
