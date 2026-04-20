import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Partners',
  description: 'Technology partners delivering best-in-class solutions across Analytics, Automation, and Enterprise Computing.',
}

const CATEGORY_LABELS: Record<string, string> = {
  'data-analytics':           'Data Analytics',
  'enterprise-computing':     'Enterprise Computing',
  'plm':                      'Product Lifecycle Management',
  'automation':               'Automation',
  'other':                    'Other',
}

export default async function PartnersPage() {
  const payload = await getPayload({ config: configPromise })
  const { docs: partners } = await payload.find({
    collection: 'partners',
    sort: 'name',
    limit: 50,
  })

  const grouped = partners.reduce<Record<string, typeof partners>>((acc, p) => {
    const cat = p.category ?? 'other'
    acc[cat] = acc[cat] ?? []
    acc[cat].push(p)
    return acc
  }, {})

  return (
    <>
      <section className="page-header">
        <div className="container">
          <div className="breadcrumb"><a href="/">Home</a> <span>/</span> Explore <span>/</span> Partners</div>
          <h1>Our Partners</h1>
          <p>
            Swajyot partners deliver SMART, Robust, Modular and Scalable solutions across
            Analytics, Automation, Data Science, and Information Management.
          </p>
        </div>
      </section>

      {partners.length === 0 ? (
        <section className="section"><div className="container"><p>Partner information coming soon.</p></div></section>
      ) : (
        Object.entries(grouped).map(([category, items]) => (
          <section key={category} className="section section--soft" style={{ paddingTop: '56px', paddingBottom: '56px' }}>
            <div className="container">
              <h2 className="section-title">{CATEGORY_LABELS[category] ?? category}</h2>
              <div className="card-grid card-grid--3" style={{ marginTop: '28px' }}>
                {items.map((p) => (
                  <Link key={p.id} href={`/explore/partners/${p.slug}`} className="card partner-card">
                    <div className="card__title">{p.name}</div>
                    {p.description && <p className="card__desc">{p.description}</p>}
                    <span className="card__link">Learn more →</span>
                  </Link>
                ))}
              </div>
            </div>
          </section>
        ))
      )}
    </>
  )
}
