'use client'

export default function ViewResponsesCell({ rowData }: { rowData?: any }) {
  const form   = rowData?.form
  const formId = typeof form === 'object' ? form?.id : form
  if (!formId) return null

  return (
    <a
      href={`/admin/form-responses?formId=${formId}`}
      onClick={(e) => e.stopPropagation()}
      style={{
        display: 'inline-flex', alignItems: 'center', gap: '5px',
        padding: '4px 12px', borderRadius: '5px', fontSize: '0.78rem', fontWeight: 600,
        background: 'var(--theme-elevation-150, #003087)', color: 'var(--theme-text, #fff)',
        textDecoration: 'none', border: '1px solid var(--theme-border-color, #e2e8f0)',
        whiteSpace: 'nowrap',
      }}
    >
      View Responses →
    </a>
  )
}
