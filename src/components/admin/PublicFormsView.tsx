'use client'

import { useEffect, useState } from 'react'

type Form = {
  id: string
  title: string
  slug?: string | null
  description?: string | null
  _status?: 'draft' | 'published' | null
}

export default function PublicFormsView() {
  const [forms, setForms] = useState<Form[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetch('/api/forms?limit=100&draft=true&depth=0')
      .then((r) => r.json())
      .then((d) => setForms(d.docs ?? []))
      .catch(() => {})
      .finally(() => setLoading(false))
  }, [])

  const base = typeof window !== 'undefined' ? window.location.origin : ''

  return (
    <div style={{ padding: '40px', minHeight: '100vh', background: 'var(--theme-bg, #f8fafc)' }}>

      {/* Header */}
      <div style={{ marginBottom: '28px' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', flexWrap: 'wrap', gap: '12px' }}>
          <div>
            <h1 style={{ margin: 0, fontSize: '1.5rem', fontWeight: 800, color: 'var(--theme-text, #1a1a2e)' }}>
              Public Forms
            </h1>
            <p style={{ margin: '4px 0 0', fontSize: '0.85rem', color: 'var(--theme-text-dim, #6b7280)' }}>
              Forms published at a public URL. Create and publish forms to share with users.
            </p>
          </div>
          <a
            href="/admin/collections/forms/create"
            style={{
              display: 'inline-flex', alignItems: 'center', gap: '6px',
              padding: '9px 18px', background: 'var(--color-success-500, #003087)', color: '#fff',
              borderRadius: '7px', fontWeight: 600, fontSize: '0.85rem', textDecoration: 'none',
            }}
          >
            + New Form
          </a>
        </div>
      </div>

      {/* Table */}
      <div style={{
        background: 'var(--theme-elevation-0, #fff)',
        border: '1px solid var(--theme-border-color, #e2e8f0)',
        borderRadius: '8px', overflow: 'hidden',
      }}>
        {/* Toolbar */}
        <div style={{
          padding: '14px 20px', borderBottom: '1px solid var(--theme-border-color, #e2e8f0)',
          background: 'var(--theme-elevation-50, #fafafa)',
          fontSize: '0.82rem', color: 'var(--theme-text-dim, #6b7280)', fontWeight: 600,
        }}>
          {loading ? 'Loading…' : `${forms.length} form${forms.length !== 1 ? 's' : ''}`}
        </div>

        {loading ? (
          <div style={{ padding: '64px', textAlign: 'center', color: 'var(--theme-text-dim, #9ca3af)' }}>
            Loading…
          </div>
        ) : forms.length === 0 ? (
          <div style={{ padding: '64px', textAlign: 'center', color: 'var(--theme-text-dim, #9ca3af)' }}>
            <div style={{ fontSize: '2.5rem', marginBottom: '12px' }}>📋</div>
            <div style={{ fontWeight: 700, marginBottom: '6px', color: 'var(--theme-text, #374151)' }}>No forms yet</div>
            <div style={{ fontSize: '0.85rem', marginBottom: '20px' }}>Create your first form to share publicly.</div>
            <a
              href="/admin/collections/forms/create"
              style={{
                display: 'inline-flex', alignItems: 'center', gap: '6px',
                padding: '9px 18px', background: 'var(--color-success-500, #003087)', color: '#fff',
                borderRadius: '7px', fontWeight: 600, fontSize: '0.85rem', textDecoration: 'none',
              }}
            >
              + New Form
            </a>
          </div>
        ) : (
          <div style={{ overflowX: 'auto' }}>
            <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '0.83rem' }}>
              <thead>
                <tr style={{
                  background: 'var(--theme-elevation-100, #f8fafc)',
                  borderBottom: '2px solid var(--theme-border-color, #e2e8f0)',
                }}>
                  {['Form Title', 'Slug', 'Status', 'Public URL', 'Actions'].map((h) => (
                    <th key={h} style={{
                      padding: '11px 16px', textAlign: 'left', fontWeight: 700,
                      color: 'var(--theme-text, #374151)', fontSize: '0.75rem',
                      textTransform: 'uppercase', letterSpacing: '0.06em', whiteSpace: 'nowrap',
                    }}>
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {forms.map((form, i) => {
                  const published = form._status === 'published'
                  const publicUrl = form.slug ? `${base}/forms/${form.slug}` : null

                  return (
                    <tr key={form.id} style={{
                      borderBottom: '1px solid var(--theme-border-color, #f1f5f9)',
                      background: i % 2 === 0 ? 'var(--theme-elevation-0, #fff)' : 'var(--theme-elevation-50, #fafafa)',
                    }}>
                      {/* Title */}
                      <td style={{ padding: '12px 16px', fontWeight: 700, color: 'var(--theme-text, #1a1a2e)' }}>
                        <a
                          href={`/admin/collections/forms/${form.id}`}
                          style={{ color: 'inherit', textDecoration: 'none' }}
                          onMouseEnter={(e) => ((e.currentTarget as HTMLElement).style.color = 'var(--color-success-500, #003087)')}
                          onMouseLeave={(e) => ((e.currentTarget as HTMLElement).style.color = 'inherit')}
                        >
                          {form.title}
                        </a>
                      </td>

                      {/* Slug */}
                      <td style={{ padding: '12px 16px', color: 'var(--theme-text-dim, #6b7280)', fontFamily: 'monospace', fontSize: '0.8rem' }}>
                        {form.slug ?? <span style={{ color: 'var(--theme-text-dim, #d1d5db)' }}>—</span>}
                      </td>

                      {/* Status */}
                      <td style={{ padding: '12px 16px' }}>
                        <span style={{
                          display: 'inline-block', padding: '3px 10px', borderRadius: '20px',
                          fontSize: '0.72rem', fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em',
                          background: published ? '#dcfce7' : '#fef9c3',
                          color: published ? '#15803d' : '#92400e',
                        }}>
                          {published ? 'Published' : 'Draft'}
                        </span>
                      </td>

                      {/* Public URL */}
                      <td style={{ padding: '12px 16px', maxWidth: '280px', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                        {publicUrl ? (
                          <a
                            href={publicUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                            style={{ color: 'var(--color-success-500, #003087)', fontSize: '0.8rem', textDecoration: 'underline' }}
                          >
                            {publicUrl}
                          </a>
                        ) : (
                          <span style={{ color: 'var(--theme-text-dim, #d1d5db)', fontSize: '0.8rem' }}>No slug set</span>
                        )}
                      </td>

                      {/* Actions */}
                      <td style={{ padding: '12px 16px', whiteSpace: 'nowrap' }}>
                        <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                          <a
                            href={`/admin/collections/forms/${form.id}`}
                            style={actionBtn('#003087')}
                          >
                            Edit
                          </a>
                          <a
                            href={`/admin/form-responses?formId=${form.id}`}
                            style={actionBtn('#6b7280')}
                          >
                            Responses
                          </a>
                          {publicUrl && published && (
                            <a
                              href={publicUrl}
                              target="_blank"
                              rel="noopener noreferrer"
                              style={actionBtn('#15803d')}
                            >
                              ↗ View
                            </a>
                          )}
                        </div>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  )
}

const actionBtn = (bg: string): React.CSSProperties => ({
  display: 'inline-flex', alignItems: 'center',
  padding: '5px 12px', background: bg, color: '#fff',
  borderRadius: '5px', fontWeight: 600, fontSize: '0.78rem',
  textDecoration: 'none',
})
