import Link from 'next/link'
import { getPayload } from 'payload'
import configPromise from '@payload-config'

export default async function Footer() {
  const payload = await getPayload({ config: configPromise })
  const [settings, footer] = await Promise.all([
    payload.findGlobal({ slug: 'site-settings' }),
    payload.findGlobal({ slug: 'footer' }),
  ])

  const hasFooterCols = footer.columns && footer.columns.length > 0

  return (
    <footer className="footer">
      <div className="container">
        <div className="footer__grid">
          {/* Brand column */}
          <div>
            <div className="footer__brand-name">{settings.companyName ?? 'Swajyot Technologies'}</div>
            <p className="footer__brand-desc">
              {settings.tagline ?? 'Always Creating Value'}<br />
              Over 10 years helping companies reach their financial and branding goals through
              Digital Transformation Solutions &amp; Services.
            </p>
            {settings.email && (
              <p style={{ fontSize: '0.85rem', marginBottom: '4px' }}>
                📧 <a href={`mailto:${settings.email}`} className="footer__link" style={{ display: 'inline' }}>{settings.email}</a>
              </p>
            )}
            {settings.phone && (
              <p style={{ fontSize: '0.85rem', marginBottom: '16px' }}>
                📞 {settings.phone}
              </p>
            )}
            {settings.social && (
              <div className="footer__social">
                {settings.social.linkedin  && <a href={settings.social.linkedin}  target="_blank" rel="noopener noreferrer" aria-label="LinkedIn">in</a>}
                {settings.social.twitter   && <a href={settings.social.twitter}   target="_blank" rel="noopener noreferrer" aria-label="Twitter">𝕏</a>}
                {settings.social.facebook  && <a href={settings.social.facebook}  target="_blank" rel="noopener noreferrer" aria-label="Facebook">f</a>}
                {settings.social.instagram && <a href={settings.social.instagram} target="_blank" rel="noopener noreferrer" aria-label="Instagram">📷</a>}
              </div>
            )}
          </div>

          {/* Dynamic columns from CMS */}
          {hasFooterCols
            ? footer.columns!.map((col) => (
                <div key={col.id}>
                  <div className="footer__col-title">{col.heading}</div>
                  {col.links?.map((l) => (
                    <Link key={l.id} href={l.url} className="footer__link">{l.label}</Link>
                  ))}
                </div>
              ))
            : (
              /* Fallback static columns */
              <>
                <div>
                  <div className="footer__col-title">Solutions</div>
                  <Link href="/solutions/analytics-ai" className="footer__link">Analytics &amp; AI</Link>
                  <Link href="/solutions/digital-process-automation" className="footer__link">Digital Process Automation</Link>
                  <Link href="/solutions/enterprise-quality-management" className="footer__link">Quality Management</Link>
                  <Link href="/solutions/manufacturing-excellence" className="footer__link">Manufacturing Excellence</Link>
                  <Link href="/solutions" className="footer__link">View All →</Link>
                </div>
                <div>
                  <div className="footer__col-title">Services</div>
                  <Link href="/services/software-development" className="footer__link">Software Development</Link>
                  <Link href="/services/analytics-outsourcing" className="footer__link">Analytics Outsourcing</Link>
                  <div className="footer__col-title" style={{ marginTop: '20px' }}>Industries</div>
                  <Link href="/industries/manufacturing" className="footer__link">Manufacturing</Link>
                  <Link href="/industries/pharmaceuticals-life-sciences" className="footer__link">Pharmaceuticals</Link>
                  <Link href="/industries/healthcare" className="footer__link">Healthcare</Link>
                </div>
                <div>
                  <div className="footer__col-title">Explore</div>
                  <Link href="/explore/about-us"  className="footer__link">About Us</Link>
                  <Link href="/explore/partners"  className="footer__link">Partners</Link>
                  <Link href="/explore/webinars"  className="footer__link">Webinars</Link>
                  <Link href="/contact-us"         className="footer__link">Contact Us</Link>
                  <div className="footer__col-title" style={{ marginTop: '20px' }}>Address</div>
                  {settings.address && (
                    <address style={{ fontStyle: 'normal', fontSize: '0.82rem', lineHeight: '1.7' }}>
                      {settings.address.line1}<br />
                      {settings.address.city}, {settings.address.state}<br />
                      {settings.address.pincode}, {settings.address.country}
                    </address>
                  )}
                </div>
              </>
            )}
        </div>

        <div className="footer__bottom">
          <p className="footer__copy">
            {footer.copyright ?? `© ${new Date().getFullYear()} ${settings.companyName ?? 'Swajyot Technologies Pvt. Ltd.'}. All rights reserved.`}
          </p>
          <div className="footer__bottom-links">
            {footer.bottomLinks?.map((l) => (
              <Link key={l.id} href={l.url}>{l.label}</Link>
            ))}
          </div>
        </div>
      </div>
    </footer>
  )
}
