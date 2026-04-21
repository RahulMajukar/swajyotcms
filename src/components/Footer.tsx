import Link from 'next/link'
import { getPayload } from 'payload'
import configPromise from '@payload-config'

export default async function Footer() {
  const payload = await getPayload({ config: configPromise })
  const [settings, footer] = await Promise.all([
    payload.findGlobal({ slug: 'site-settings', depth: 1 }),
    payload.findGlobal({ slug: 'footer' }),
  ])

  const logoUrl =
    typeof settings.logo === 'object' && settings.logo !== null
      ? (settings.logo as { url?: string | null }).url ?? null
      : null

  const cols = footer.columns ?? []
  // Brand col + link cols = total columns in grid
  const gridCols = `1.6fr ${cols.map(() => '1fr').join(' ')}`.trim()

  return (
    <footer className="footer">
      <div className="container">
        <div
          className="footer__grid"
          style={{ gridTemplateColumns: cols.length > 0 ? gridCols : '1fr' }}
        >
          {/* ── Brand column ── */}
          <div>
            <img
              src={logoUrl ?? '/images/logo-side.png'}
              alt={settings.companyName ?? 'Swajyot Technologies'}
              style={{ height: '52px', width: 'auto', objectFit: 'contain', marginBottom: '20px' }}
            />
            <p className="footer__brand-desc">
              {footer.brandDescription ?? settings.tagline ?? 'Always Creating Value'}
            </p>

            {settings.email && (
              <p style={{ fontSize: '0.85rem', marginBottom: '4px', color: '#94a3b8' }}>
                📧{' '}
                <a href={`mailto:${settings.email}`} className="footer__link" style={{ display: 'inline' }}>
                  {settings.email}
                </a>
              </p>
            )}
            {settings.phone && (
              <p style={{ fontSize: '0.85rem', marginBottom: '12px', color: '#94a3b8' }}>
                📞 {settings.phone}
              </p>
            )}

            {footer.showAddress !== false && settings.address && (
              <address style={{ fontStyle: 'normal', fontSize: '0.82rem', lineHeight: '1.7', color: '#64748b', marginBottom: '16px' }}>
                {settings.address.line1 && <>{settings.address.line1}<br /></>}
                {settings.address.line2 && <>{settings.address.line2}<br /></>}
                {settings.address.city && <>{settings.address.city}{settings.address.state ? `, ${settings.address.state}` : ''}<br /></>}
                {settings.address.pincode && <>{settings.address.pincode}{settings.address.country ? `, ${settings.address.country}` : ''}</>}
              </address>
            )}

            {footer.showSocial !== false && settings.social && (
              <div className="footer__social">
                {settings.social.linkedin  && <a href={settings.social.linkedin}  target="_blank" rel="noopener noreferrer" aria-label="LinkedIn">in</a>}
                {settings.social.twitter   && <a href={settings.social.twitter}   target="_blank" rel="noopener noreferrer" aria-label="Twitter">𝕏</a>}
                {settings.social.facebook  && <a href={settings.social.facebook}  target="_blank" rel="noopener noreferrer" aria-label="Facebook">f</a>}
                {settings.social.instagram && <a href={settings.social.instagram} target="_blank" rel="noopener noreferrer" aria-label="Instagram">ig</a>}
                {settings.social.youtube   && <a href={settings.social.youtube}   target="_blank" rel="noopener noreferrer" aria-label="YouTube">▶</a>}
              </div>
            )}
          </div>

          {/* ── CMS-managed link columns ── */}
          {cols.map((col) => (
            <div key={col.id}>
              <div className="footer__col-title">{col.heading}</div>
              {col.links?.map((l) => (
                <Link key={l.id} href={l.url} className="footer__link">
                  {l.label}
                </Link>
              ))}
            </div>
          ))}
        </div>

        {/* ── Bottom bar ── */}
        <div className="footer__bottom">
          <p className="footer__copy">
            {footer.copyright ??
              `© ${new Date().getFullYear()} ${settings.companyName ?? 'Swajyot Technologies Pvt. Ltd.'}. All rights reserved.`}
          </p>
          {footer.bottomLinks && footer.bottomLinks.length > 0 && (
            <div className="footer__bottom-links">
              {footer.bottomLinks.map((l) => (
                <Link key={l.id} href={l.url}>{l.label}</Link>
              ))}
            </div>
          )}
        </div>
      </div>
    </footer>
  )
}
