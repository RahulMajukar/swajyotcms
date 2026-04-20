import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'

export default async function HomePage() {
  const payload = await getPayload({ config: configPromise })

  const [settings, solutions, services, industries, partners] = await Promise.all([
    payload.findGlobal({ slug: 'site-settings' }),
    payload.find({ collection: 'solutions', limit: 6, where: { _status: { equals: 'published' } } }),
    payload.find({ collection: 'services', limit: 6, where: { _status: { equals: 'published' } } }),
    payload.find({ collection: 'industries', limit: 4, where: { _status: { equals: 'published' } } }),
    payload.find({ collection: 'partners', limit: 8 }),
  ])

  return (
    <>
      {/* Hero */}
      <section className="hero">
        <div className="container">
          <p className="hero__eyebrow">Digital Transformation Solutions</p>
          <h1 className="hero__title">
            {settings.tagline ?? 'Always Creating Value'}
          </h1>
          <p className="hero__sub">
            Over 10 years helping enterprises reach their financial and branding goals through
            Analytics &amp; AI, Digital Process Automation, and Enterprise Computing Management.
          </p>
          <div className="hero__actions">
            <Link href="/solutions" className="btn btn-primary">Explore Solutions</Link>
            <Link href="/contact-us" className="btn btn-outline">Contact Us</Link>
          </div>
        </div>
      </section>

      {/* Stats */}
      <section className="section" style={{ paddingTop: '48px', paddingBottom: '48px', borderBottom: '1px solid var(--border)' }}>
        <div className="container">
          <div className="stats-row">
            <div className="stat"><div className="stat__number">10+</div><div className="stat__label">Years of Experience</div></div>
            <div className="stat"><div className="stat__number">9</div><div className="stat__label">Enterprise Solutions</div></div>
            <div className="stat"><div className="stat__number">4</div><div className="stat__label">Industry Verticals</div></div>
            <div className="stat"><div className="stat__number">5+</div><div className="stat__label">Technology Partners</div></div>
          </div>
        </div>
      </section>

      {/* Solutions */}
      <section className="section section--soft">
        <div className="container">
          <p className="section-label">What We Offer</p>
          <h2 className="section-title">Our Solutions</h2>
          <p className="section-sub">
            Understand business trends, predict future outcomes and make SMART data-driven
            decisions with our integrated solution portfolio.
          </p>
          {solutions.docs.length > 0 ? (
            <>
              <div className="card-grid card-grid--3">
                {solutions.docs.map((s) => (
                  <Link href={`/solutions/${s.slug}`} key={s.id} className="card">
                    <div className="card__title">{s.title}</div>
                    <p className="card__desc">{s.shortDescription}</p>
                    <span className="card__link">Learn more →</span>
                  </Link>
                ))}
              </div>
              <div style={{ marginTop: '32px', textAlign: 'center' }}>
                <Link href="/solutions" className="btn btn-blue">View All Solutions</Link>
              </div>
            </>
          ) : (
            <p>Solutions will appear here once added from the admin panel.</p>
          )}
        </div>
      </section>

      {/* Services */}
      {services.docs.length > 0 && (
        <section className="section">
          <div className="container">
            <p className="section-label">How We Help</p>
            <h2 className="section-title">Our Services</h2>
            <p className="section-sub">
              Best-in-class technology services designed to adapt to your environment.
            </p>
            <div className="card-grid card-grid--2">
              {services.docs.map((s) => (
                <Link href={`/services/${s.slug}`} key={s.id} className="card">
                  <div className="card__title">{s.title}</div>
                  <p className="card__desc">{s.shortDescription}</p>
                  <span className="card__link">Learn more →</span>
                </Link>
              ))}
            </div>
          </div>
        </section>
      )}

      {/* Industries */}
      {industries.docs.length > 0 && (
        <section className="section section--soft">
          <div className="container">
            <p className="section-label">Who We Serve</p>
            <h2 className="section-title">Industries We Serve</h2>
            <div className="card-grid card-grid--4">
              {industries.docs.map((i) => (
                <Link href={`/industries/${i.slug}`} key={i.id} className="card">
                  <div className="card__title">{i.title}</div>
                  <p className="card__desc">{i.shortDescription}</p>
                  <span className="card__link">Explore →</span>
                </Link>
              ))}
            </div>
          </div>
        </section>
      )}

      {/* Partners */}
      {partners.docs.length > 0 && (
        <section className="section">
          <div className="container">
            <p className="section-label">Ecosystem</p>
            <h2 className="section-title">Our Technology Partners</h2>
            <p className="section-sub">
              Delivering SMART, Robust, Modular and Scalable solutions through world-class partnerships.
            </p>
            <div className="card-grid card-grid--4">
              {partners.docs.map((p) => (
                <Link href={`/explore/partners/${p.slug}`} key={p.id} className="card">
                  <div className="card__title">{p.name}</div>
                  {p.description && <p className="card__desc">{p.description}</p>}
                </Link>
              ))}
            </div>
          </div>
        </section>
      )}

      {/* CTA */}
      <section className="cta-band">
        <div className="container">
          <h2>Ready to Transform Your Business?</h2>
          <p>
            Talk to our experts about how Swajyot Technologies can help you achieve
            operational excellence and sustainable growth.
          </p>
          <div className="cta-band__actions">
            <Link href="/contact-us" className="btn btn-primary">Get In Touch</Link>
            <Link href="/explore/about-us" className="btn btn-outline">About Us</Link>
          </div>
        </div>
      </section>
    </>
  )
}
