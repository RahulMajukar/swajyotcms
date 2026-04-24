'use client'

import { useEffect, useState, useCallback } from 'react'

type Form = { id: string; title: string }
type Entry = { field: string; value: string }
type Submission = {
  id: string
  createdAt: string
  form: { id: string; title: string } | string
  submissionData: Entry[]
}

const PAGE_SIZE = 25

export default function FormResponsesView() {
  const [forms, setForms]             = useState<Form[]>([])
  const [submissions, setSubmissions] = useState<Submission[]>([])
  const [total, setTotal]             = useState(0)
  const [loading, setLoading]         = useState(true)
  const [page, setPage]               = useState(1)

  // Read initial formId from URL on mount
  const [formId,   setFormId]   = useState('')
  const [dateFrom, setDateFrom] = useState('')
  const [dateTo,   setDateTo]   = useState('')
  const [activeForm, setActiveForm] = useState<Form | null>(null)

  useEffect(() => {
    const params = new URLSearchParams(window.location.search)
    const fid = params.get('formId') ?? ''
    setFormId(fid)
  }, [])

  useEffect(() => {
    fetch('/api/forms?limit=100&depth=0')
      .then((r) => r.json())
      .then((d) => setForms(d.docs ?? []))
      .catch(() => {})
  }, [])

  useEffect(() => {
    if (formId && forms.length) {
      setActiveForm(forms.find((f) => f.id === formId) ?? null)
    } else {
      setActiveForm(null)
    }
  }, [formId, forms])

  const fetchSubmissions = useCallback(async () => {
    setLoading(true)
    try {
      const params = new URLSearchParams()
      params.set('depth', '1')
      params.set('limit', String(PAGE_SIZE))
      params.set('page', String(page))
      params.set('sort', '-createdAt')
      if (formId)   params.set('where[form][equals]', formId)
      if (dateFrom) params.set('where[createdAt][greater_than]', new Date(dateFrom).toISOString())
      if (dateTo)   params.set('where[createdAt][less_than]', new Date(dateTo + 'T23:59:59').toISOString())
      const res  = await fetch(`/api/form-submissions?${params}`)
      const data = await res.json()
      setSubmissions(data.docs ?? [])
      setTotal(data.totalDocs ?? 0)
    } catch { /* ignore */ }
    setLoading(false)
  }, [formId, dateFrom, dateTo, page])

  useEffect(() => { fetchSubmissions() }, [fetchSubmissions])

  const exportUrl = (format: string) => {
    const p = new URLSearchParams({ format })
    if (formId)   p.set('formId', formId)
    if (dateFrom) p.set('dateFrom', new Date(dateFrom).toISOString())
    if (dateTo)   p.set('dateTo', new Date(dateTo + 'T23:59:59').toISOString())
    return `/api/export?${p.toString()}`
  }

  const allFields = Array.from(
    new Set(submissions.flatMap((s) => s.submissionData?.map((e) => e.field) ?? []))
  )
  const totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE))

  return (
    <div className="payload-form-responses" style={{ padding: '40px', minHeight: '100vh', background: 'var(--theme-bg, #f8fafc)' }}>

      {/* ── Header ── */}
      <div style={{ marginBottom: '28px' }}>
        <a
          href="/admin/collections/form-submissions"
          style={{ display: 'inline-flex', alignItems: 'center', gap: '6px', fontSize: '0.82rem', color: 'var(--theme-text-dim, #6b7280)', textDecoration: 'none', marginBottom: '12px' }}
        >
          ← Back to Form Submissions
        </a>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', flexWrap: 'wrap', gap: '12px' }}>
          <div>
            <h1 style={{ margin: 0, fontSize: '1.5rem', fontWeight: 800, color: 'var(--theme-text, #1a1a2e)' }}>
              Form Responses
            </h1>
            <p style={{ margin: '4px 0 0', fontSize: '0.85rem', color: 'var(--theme-text-dim, #6b7280)' }}>
              {activeForm ? <>Showing: <strong>{activeForm.title}</strong> · </> : ''}{total} submission{total !== 1 ? 's' : ''}
            </p>
          </div>
          <div style={{ display: 'flex', gap: '8px' }}>
            <a href={exportUrl('csv')} style={exportBtn('#003087')}>⬇ CSV</a>
            <a href={exportUrl('excel')} style={exportBtn('#1d6f42')}>⬇ Excel</a>
          </div>
        </div>
      </div>

      {/* ── Filters ── */}
      <div style={card}>
        <p style={sectionLabel}>Filters</p>
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '12px', alignItems: 'flex-end' }}>
          <div style={fieldGroup}>
            <label style={labelStyle}>Form</label>
            <select value={formId} onChange={(e) => { setFormId(e.target.value); setPage(1) }} style={{ ...inputStyle, minWidth: '220px' }}>
              <option value="">All Forms</option>
              {forms.map((f) => <option key={f.id} value={f.id}>{f.title}</option>)}
            </select>
          </div>
          <div style={fieldGroup}>
            <label style={labelStyle}>From Date</label>
            <input type="date" value={dateFrom} onChange={(e) => { setDateFrom(e.target.value); setPage(1) }} style={inputStyle} />
          </div>
          <div style={fieldGroup}>
            <label style={labelStyle}>To Date</label>
            <input type="date" value={dateTo} onChange={(e) => { setDateTo(e.target.value); setPage(1) }} style={inputStyle} />
          </div>
          <div style={{ display: 'flex', gap: '8px' }}>
            <button onClick={fetchSubmissions} style={primaryBtn}>Apply</button>
            <button onClick={() => { setFormId(''); setDateFrom(''); setDateTo(''); setPage(1) }} style={ghostBtn}>Clear</button>
          </div>
        </div>
      </div>

      {/* ── Table ── */}
      <div style={{ ...card, padding: 0, overflow: 'hidden' }}>

        {/* Toolbar */}
        <div style={{ padding: '14px 20px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderBottom: '1px solid var(--theme-border-color, #e2e8f0)', background: 'var(--theme-elevation-50, #fafafa)' }}>
          <span style={{ fontSize: '0.82rem', color: 'var(--theme-text-dim, #6b7280)', fontWeight: 600 }}>
            {loading ? 'Loading…' : `${submissions.length} of ${total} submissions`}
          </span>
          <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}>
            <button onClick={() => setPage((p) => Math.max(1, p - 1))} disabled={page <= 1} style={pageBtn(page <= 1)}>← Prev</button>
            <span style={{ fontSize: '0.8rem', color: 'var(--theme-text-dim, #6b7280)', padding: '0 10px' }}>
              {page} / {totalPages}
            </span>
            <button onClick={() => setPage((p) => Math.min(totalPages, p + 1))} disabled={page >= totalPages} style={pageBtn(page >= totalPages)}>Next →</button>
          </div>
        </div>

        {loading ? (
          <div style={{ padding: '64px', textAlign: 'center', color: 'var(--theme-text-dim, #9ca3af)' }}>Loading…</div>
        ) : submissions.length === 0 ? (
          <div style={{ padding: '64px', textAlign: 'center', color: 'var(--theme-text-dim, #9ca3af)' }}>
            <div style={{ fontSize: '2.5rem', marginBottom: '12px' }}>📭</div>
            <div style={{ fontWeight: 700, marginBottom: '6px', color: 'var(--theme-text, #374151)' }}>No submissions found</div>
            <div style={{ fontSize: '0.85rem' }}>Try adjusting your filters.</div>
          </div>
        ) : (
          <div style={{ overflowX: 'auto' }}>
            <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '0.83rem' }}>
              <thead>
                <tr style={{ background: 'var(--theme-elevation-100, #f8fafc)', borderBottom: '2px solid var(--theme-border-color, #e2e8f0)' }}>
                  <th style={th}>#</th>
                  <th style={th}>Submitted At</th>
                  <th style={th}>Form</th>
                  {allFields.map((f) => <th key={f} style={th}>{f}</th>)}
                </tr>
              </thead>
              <tbody>
                {submissions.map((sub, i) => {
                  const dataMap: Record<string, string> = {}
                  sub.submissionData?.forEach((e) => { dataMap[e.field] = e.value })
                  const formName = typeof sub.form === 'object' ? sub.form.title : sub.form
                  return (
                    <tr key={sub.id} style={{ borderBottom: '1px solid var(--theme-border-color, #f1f5f9)', background: i % 2 === 0 ? 'var(--theme-elevation-0, #fff)' : 'var(--theme-elevation-50, #fafafa)' }}>
                      <td style={{ ...td, color: 'var(--theme-text-dim, #9ca3af)', width: '40px' }}>{(page - 1) * PAGE_SIZE + i + 1}</td>
                      <td style={{ ...td, whiteSpace: 'nowrap', color: 'var(--theme-text-dim, #6b7280)' }}>
                        {new Date(sub.createdAt).toLocaleString('en-IN', { dateStyle: 'medium', timeStyle: 'short' })}
                      </td>
                      <td style={{ ...td, fontWeight: 700, color: 'var(--theme-text, #1a1a2e)', whiteSpace: 'nowrap' }}>{formName}</td>
                      {allFields.map((f) => (
                        <td key={f} style={td}>
                          {dataMap[f] || <span style={{ color: 'var(--theme-text-dim, #d1d5db)' }}>—</span>}
                        </td>
                      ))}
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

// ── Styles ──
const card: React.CSSProperties = {
  background: 'var(--theme-elevation-0, #fff)',
  border: '1px solid var(--theme-border-color, #e2e8f0)',
  borderRadius: '8px', padding: '20px 24px', marginBottom: '16px',
}
const sectionLabel: React.CSSProperties = {
  fontSize: '0.7rem', fontWeight: 700, color: 'var(--theme-text-dim, #6b7280)',
  textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: '14px', marginTop: 0,
}
const fieldGroup: React.CSSProperties = { display: 'flex', flexDirection: 'column', gap: '5px' }
const labelStyle: React.CSSProperties = { fontSize: '0.78rem', fontWeight: 600, color: 'var(--theme-text, #374151)' }
const inputStyle: React.CSSProperties = {
  padding: '8px 12px', border: '1.5px solid var(--theme-border-color, #e2e8f0)',
  borderRadius: '6px', fontSize: '0.85rem', fontFamily: 'inherit',
  color: 'var(--theme-text, #1a1a2e)', background: 'var(--theme-input-bg, #fff)', outline: 'none',
}
const primaryBtn: React.CSSProperties = {
  padding: '8px 18px', background: 'var(--color-success-500, #003087)', color: '#fff',
  border: 'none', borderRadius: '6px', fontSize: '0.85rem', fontWeight: 600, cursor: 'pointer',
}
const ghostBtn: React.CSSProperties = {
  padding: '8px 14px', background: 'transparent', color: 'var(--theme-text-dim, #6b7280)',
  border: '1.5px solid var(--theme-border-color, #e2e8f0)', borderRadius: '6px',
  fontSize: '0.85rem', fontWeight: 600, cursor: 'pointer',
}
const exportBtn = (bg: string): React.CSSProperties => ({
  display: 'inline-flex', alignItems: 'center', gap: '6px',
  padding: '9px 18px', background: bg, color: '#fff',
  borderRadius: '7px', fontWeight: 600, fontSize: '0.85rem', textDecoration: 'none',
})
const pageBtn = (disabled: boolean): React.CSSProperties => ({
  padding: '5px 12px', fontSize: '0.8rem', fontWeight: 600, cursor: disabled ? 'default' : 'pointer',
  border: 'none', borderRadius: '5px',
  background: disabled ? 'var(--theme-elevation-100, #f1f5f9)' : 'var(--color-success-500, #003087)',
  color: disabled ? 'var(--theme-text-dim, #9ca3af)' : '#fff',
})
const th: React.CSSProperties = {
  padding: '11px 16px', textAlign: 'left', fontWeight: 700,
  color: 'var(--theme-text, #374151)', fontSize: '0.75rem',
  textTransform: 'uppercase', letterSpacing: '0.06em', whiteSpace: 'nowrap',
}
const td: React.CSSProperties = {
  padding: '11px 16px', color: 'var(--theme-text, #374151)',
  verticalAlign: 'middle', maxWidth: '240px',
  overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap',
}
