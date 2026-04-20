import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import RichText from '@/components/RichText'

type Props = { params: Promise<{ slug: string }> }

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'industries',
    where: { slug: { equals: slug } },
    limit: 1,
  })
  const industry = docs[0]
  if (!industry) return {}
  return {
    title: industry.seo?.metaTitle ?? industry.title,
    description: industry.seo?.metaDescription ?? industry.shortDescription,
  }
}

export default async function IndustryDetailPage({ params }: Props) {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'industries',
    where: { slug: { equals: slug } },
    depth: 1,
    limit: 1,
  })
  const industry = docs[0]
  if (!industry) notFound()

  return (
    <>
      <article>
        <header>
          <h1>{industry.title}</h1>
          <p>{industry.shortDescription}</p>
        </header>

        {industry.description && (
          <section>
            <RichText content={industry.description as any} />
          </section>
        )}

        {Array.isArray(industry.solutions) && industry.solutions.length > 0 && (
          <section>
            <h2>Solutions for {industry.title}</h2>
            <ul>
              {industry.solutions.map((sol) => {
                if (typeof sol === 'object' && sol !== null) {
                  return (
                    <li key={sol.id}>
                      <Link href={`/solutions/${sol.slug}`}>
                        <h3>{sol.title}</h3>
                        <p>{sol.shortDescription}</p>
                      </Link>
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
        <Link href="/contact-us">Talk to an Expert</Link>
      </aside>
    </>
  )
}
