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
    collection: 'pages',
    where: { slug: { equals: slug }, _status: { equals: 'published' } },
    limit: 1,
  })
  const page = docs[0]
  if (!page) return {}
  return {
    title: page.seo?.metaTitle ?? page.title,
    description: page.seo?.metaDescription ?? undefined,
    robots: page.seo?.noIndex ? 'noindex,nofollow' : undefined,
  }
}

export default async function StaticPage({ params }: Props) {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const { docs } = await payload.find({
    collection: 'pages',
    where: { slug: { equals: slug }, _status: { equals: 'published' } },
    limit: 1,
  })
  const page = docs[0]
  if (!page) notFound()

  return (
    <>
      {/* ── Page Header ── */}
      <section className="page-header">
        <div className="container">
          <div className="breadcrumb">
            <Link href="/">Home</Link> <span>/</span>
            <span style={{ color: '#fff' }}>{page.title}</span>
          </div>
          <h1>{page.title}</h1>
          {page.updatedAt && (
            <p style={{ fontSize: '0.82rem', marginTop: '8px', color: '#94adc4' }}>
              Last updated:{' '}
              <time dateTime={page.updatedAt}>
                {new Date(page.updatedAt).toLocaleDateString('en-IN', { dateStyle: 'long' })}
              </time>
            </p>
          )}
        </div>
      </section>

      {/* ── Content ── */}
      <section className="section">
        <div className="container">
          <div style={{ maxWidth: '800px', margin: '0 auto' }}>
            <div className="rich-text">
              <RichText content={page.content as any} />
            </div>
          </div>
        </div>
      </section>
    </>
  )
}
