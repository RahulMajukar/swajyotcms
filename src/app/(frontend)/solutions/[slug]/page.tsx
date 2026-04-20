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
    collection: 'solutions',
    where: { slug: { equals: slug } },
    limit: 1,
  })
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
    depth: 1,
    limit: 1,
  })
  const solution = docs[0]
  if (!solution) notFound()

  return (
    <>
      <nav>
        <Link href="/solutions">← All Solutions</Link>
      </nav>

      <article>
        <header>
          <h1>{solution.title}</h1>
          <p>{solution.shortDescription}</p>
        </header>

        {solution.highlights && solution.highlights.length > 0 && (
          <section>
            <h2>Key Highlights</h2>
            <ul>
              {solution.highlights.map((h, i) => (
                <li key={i}>{h.point}</li>
              ))}
            </ul>
          </section>
        )}

        {solution.description && (
          <section>
            {/* Rich text — wire up your renderer here */}
            <div data-rich-text>{JSON.stringify(solution.description)}</div>
          </section>
        )}

        {Array.isArray(solution.industries) && solution.industries.length > 0 && (
          <section>
            <h2>Applicable Industries</h2>
            <ul>
              {solution.industries.map((ind) => {
                if (typeof ind === 'object' && ind !== null) {
                  return (
                    <li key={ind.id}>
                      <Link href={`/industries/${ind.slug}`}>{ind.title}</Link>
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
        <h2>Interested in this solution?</h2>
        <Link href="/contact-us">Contact Us</Link>
      </aside>
    </>
  )
}
