import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Solutions',
  description: 'Enterprise-grade solutions across Analytics & AI, Digital Process Automation, Quality Management and more.',
}

const CATEGORY_LABELS: Record<string, string> = {
  'analytics-ai':                   'Analytics & AI',
  'enterprise-computing':           'Enterprise Computing',
  'digital-process-automation':     'Digital Process Automation',
  'quality-management':             'Quality Management',
  'information-management':         'Information Management',
  'manufacturing':                  'Manufacturing',
  'service-excellence':             'Service Excellence',
}

export default async function SolutionsPage() {
  const payload = await getPayload({ config: configPromise })
  const { docs: solutions } = await payload.find({
    collection: 'solutions',
    where: { _status: { equals: 'published' } },
    sort: 'title',
    limit: 50,
  })

  const grouped = solutions.reduce<Record<string, typeof solutions>>((acc, s) => {
    const cat = s.category ?? 'other'
    acc[cat] = acc[cat] ?? []
    acc[cat].push(s)
    return acc
  }, {})

  return (
    <>
      <section className="page-header">
        <div className="container">
          <div className="breadcrumb"><a href="/">Home</a> <span>/</span> Solutions</div>
          <h1>Our Solutions</h1>
          <p>
            Understand business trends, predict future outcomes and make SMART data-driven
            decisions with our integrated enterprise solution portfolio.
          </p>
        </div>
      </section>

      {solutions.length === 0 ? (
        <section className="section"><div className="container"><p>Solutions will appear here once published from the admin panel.</p></div></section>
      ) : (
        Object.entries(grouped).map(([category, items]) => (
          <section key={category} className="section section--soft" style={{ paddingTop: '56px', paddingBottom: '56px' }}>
            <div className="container">
              <h2 className="section-title" style={{ marginBottom: '32px' }}>
                {CATEGORY_LABELS[category] ?? category.replace(/-/g, ' ')}
              </h2>
              <div className="card-grid card-grid--3">
                {items.map((s) => (
                  <Link key={s.id} href={`/solutions/${s.slug}`} className="card">
                    <div className="card__title">{s.title}</div>
                    <p className="card__desc">{s.shortDescription}</p>
                    <span className="card__link">Learn more →</span>
                  </Link>
                ))}
              </div>
            </div>
          </section>
        ))
      )}

      <section className="cta-band">
        <div className="container">
          <h2>Not sure which solution fits your needs?</h2>
          <p>Our experts will help you identify the right solution for your business.</p>
          <div className="cta-band__actions">
            <Link href="/contact-us" className="btn btn-primary">Talk to an Expert</Link>
          </div>
        </div>
      </section>
    </>
  )
}
