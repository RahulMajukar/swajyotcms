'use client'

import Link from 'next/link'
import { useState } from 'react'

const NAV_ITEMS = [
  { label: 'Home', link: '/' },
  {
    label: 'Solutions',
    children: [
      { label: 'Enterprise Computing Management', link: '/solutions/enterprise-computing-management' },
      { label: 'Analytics & AI', link: '/solutions/analytics-ai' },
      { label: 'Digital Process Automation', link: '/solutions/digital-process-automation' },
      { label: 'Enterprise Quality Management', link: '/solutions/enterprise-quality-management' },
      { label: 'Enterprise Information Management', link: '/solutions/enterprise-information-management' },
      { label: 'Statistical Process Control', link: '/solutions/statistical-process-control' },
      { label: 'Manufacturing Excellence', link: '/solutions/manufacturing-excellence' },
      { label: 'Service Excellence', link: '/solutions/service-excellence' },
    ],
  },
  {
    label: 'Services',
    children: [
      { label: 'Software Development', link: '/services/software-development' },
      { label: 'Analytics Outsourcing', link: '/services/analytics-outsourcing' },
    ],
  },
  {
    label: 'Explore',
    children: [
      { label: 'About Us', link: '/explore/about-us' },
      { label: 'Partners', link: '/explore/partners' },
      { label: 'Webinars', link: '/explore/webinars' },
    ],
  },
]

export default function Navbar({ companyName = 'Swajyot' }: { companyName?: string }) {
  const [open, setOpen] = useState(false)
  const [activeDropdown, setActiveDropdown] = useState<string | null>(null)

  return (
    <nav className="navbar">
      <div className="navbar__inner">
        {/* Brand */}
        <Link href="/" className="navbar__brand" onClick={() => setOpen(false)}>
          <div>
            <span className="navbar__brand-name">{companyName}</span>
            <span className="navbar__brand-tag">Technologies Pvt. Ltd.</span>
          </div>
        </Link>

        {/* Desktop menu */}
        <ul className="navbar__menu">
          {NAV_ITEMS.map((item) => (
            <li key={item.label} className="navbar__item">
              {item.children ? (
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
                        </Link>
                      </li>
                    ))}
                  </ul>
                </>
              ) : (
                <Link href={item.link!} className="navbar__link">{item.label}</Link>
              )}
            </li>
          ))}
          <li>
            <Link href="/contact-us" className="navbar__link navbar__link--cta btn btn-sm">
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
          {NAV_ITEMS.map((item) => (
            <div key={item.label} style={{ marginBottom: '4px' }}>
              {item.children ? (
                <>
                  <button
                    onClick={() => setActiveDropdown(activeDropdown === item.label ? null : item.label)}
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
                  href={item.link!}
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
