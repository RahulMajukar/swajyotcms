'use client'

import { useSearchParams } from 'next/navigation'

export default function ExportButtons() {
  const searchParams = useSearchParams()
  const formId = searchParams.get('where[form][equals]') ?? ''

  const base = `/api/export${formId ? `?formId=${formId}&` : '?'}`

  return (
    <div style={{
      display: 'flex', gap: '10px', padding: '12px 0', alignItems: 'center',
      borderBottom: '1px solid #e2e8f0', marginBottom: '8px',
    }}>
      <span style={{ fontSize: '0.82rem', fontWeight: 600, color: '#6b7280' }}>Export:</span>
      <a
        href={`${base}format=csv`}
        style={{
          display: 'inline-flex', alignItems: 'center', gap: '6px',
          padding: '6px 14px', borderRadius: '6px', fontSize: '0.82rem', fontWeight: 600,
          background: '#003087', color: '#fff', textDecoration: 'none',
        }}
      >
        ⬇ CSV
      </a>
      <a
        href={`${base}format=excel`}
        style={{
          display: 'inline-flex', alignItems: 'center', gap: '6px',
          padding: '6px 14px', borderRadius: '6px', fontSize: '0.82rem', fontWeight: 600,
          background: '#1d6f42', color: '#fff', textDecoration: 'none',
        }}
      >
        ⬇ Excel
      </a>
      {formId && (
        <span style={{ fontSize: '0.78rem', color: '#9ca3af' }}>(filtered to current form)</span>
      )}
    </div>
  )
}
