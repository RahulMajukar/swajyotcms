'use client'

import Link from 'next/link'
import { useState } from 'react'

export type NavChild = { label: string; link: string; description?: string | null }
export type NavItem  = { label: string; link?: string | null; children?: NavChild[] }

export default function NavbarClient({
  companyName,
  logoUrl,
  items,
}: {
  companyName: string
  logoUrl?: string | null
  items: NavItem[]
}) {
  const [open, setOpen]               = useState(false)
  const [activeDropdown, setDropdown] = useState<string | null>(null)

  return (
    <nav className="navbar">
      <div className="navbar__inner">
        {/* Brand */}
        <Link href="/" className="navbar__brand" onClick={() => setOpen(false)}>
          <img
            src={logoUrl ?? '/images/logo-blue.png'}
            alt={companyName}
            style={{ height: '44px', width: 'auto', objectFit: 'contain' }}
          />
        </Link>

        {/* Desktop menu */}
        <ul className="navbar__menu">
          {items.map((item) => (
            <li key={item.label} className="navbar__item">
              {item.children && item.children.length > 0 ? (
                <>
                  <span className="navbar__link" style={{ cursor: 'default' }}>
                    {item.label}
                    <span className="navbar__arrow">▼</span>
                  </span>
                  <ul className="navbar__dropdown">
                    {item.children.map((child) => (
                      <li key={child.label}>
                        <Link href={child.link} className="navbar__dropdown-link">
                          {child.label}
                          {child.description && (
                            <span className="navbar__dropdown-desc">{child.description}</span>
                          )}
                        </Link>
                      </li>
                    ))}
                  </ul>
                </>
              ) : (
                <Link href={item.link ?? '/'} className="navbar__link">
                  {item.label}
                </Link>
              )}
            </li>
          ))}
          <li>
            <Link href="/contact-us" className="navbar__link navbar__link--cta">
              Contact Us
            </Link>
          </li>
        </ul>

        {/* Mobile toggle */}
        <button
          className="navbar__toggle"
          aria-label="Toggle menu"
          onClick={() => setOpen((o) => !o)}
        >
          <span style={open ? { transform: 'rotate(45deg) translate(5px, 5px)' } : {}} />
          <span style={open ? { opacity: 0 } : {}} />
          <span style={open ? { transform: 'rotate(-45deg) translate(5px, -5px)' } : {}} />
        </button>
      </div>

      {/* Mobile menu */}
      {open && (
        <div style={{
          background: '#0d1b2a', borderTop: '1px solid rgba(255,255,255,0.08)',
          padding: '12px 24px 24px',
        }}>
          {items.map((item) => (
            <div key={item.label} style={{ marginBottom: '4px' }}>
              {item.children && item.children.length > 0 ? (
                <>
                  <button
                    onClick={() => setDropdown(activeDropdown === item.label ? null : item.label)}
                    style={{
                      width: '100%', textAlign: 'left', background: 'none', border: 'none',
                      color: '#cbd5e1', padding: '10px 0', fontSize: '0.95rem',
                      fontWeight: 600, cursor: 'pointer', display: 'flex', justifyContent: 'space-between',
                    }}
                  >
                    {item.label}
                    <span style={{ opacity: 0.6, fontSize: '0.7rem' }}>
                      {activeDropdown === item.label ? '▲' : '▼'}
                    </span>
                  </button>
                  {activeDropdown === item.label && (
                    <div style={{ paddingLeft: '16px' }}>
                      {item.children.map((child) => (
                        <Link
                          key={child.label}
                          href={child.link}
                          onClick={() => setOpen(false)}
                          style={{ display: 'block', padding: '7px 0', color: '#94a3b8', fontSize: '0.88rem' }}
                        >
                          {child.label}
                        </Link>
                      ))}
                    </div>
                  )}
                </>
              ) : (
                <Link
                  href={item.link ?? '/'}
                  onClick={() => setOpen(false)}
                  style={{ display: 'block', color: '#cbd5e1', padding: '10px 0', fontWeight: 600 }}
                >
                  {item.label}
                </Link>
              )}
            </div>
          ))}
          <Link
            href="/contact-us"
            onClick={() => setOpen(false)}
            className="btn btn-primary"
            style={{ marginTop: '12px', display: 'inline-block' }}
          >
            Contact Us
          </Link>
        </div>
      )}
    </nav>
  )
}
