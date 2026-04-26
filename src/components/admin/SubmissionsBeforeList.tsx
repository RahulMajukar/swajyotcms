'use client'

const navLink: React.CSSProperties = {
  display: 'flex', alignItems: 'center', gap: '8px',
  padding: '8px 16px', borderRadius: '4px',
  color: 'var(--theme-text, #e2e8f0)', fontSize: '0.88rem', fontWeight: 500,
  textDecoration: 'none', transition: 'background 0.15s',
}

function NavLink({ href, icon, label }: { href: string; icon: string; label: string }) {
  return (
    <a
      href={href}
      style={navLink}
      onMouseEnter={(e) => ((e.currentTarget as HTMLElement).style.background = 'var(--theme-elevation-100, rgba(255,255,255,0.08))')}
      onMouseLeave={(e) => ((e.currentTarget as HTMLElement).style.background = 'transparent')}
    >
      <span style={{ fontSize: '1rem' }}>{icon}</span>
      {label}
    </a>
  )
}

export default function SubmissionsBeforeList() {
  return (
    <div style={{ padding: '4px 0' }}>
      <NavLink href="/admin/public-forms" icon="📋" label="Public Forms" />
      <NavLink href="/admin/form-responses" icon="📊" label="Form Responses" />
    </div>
  )
}
