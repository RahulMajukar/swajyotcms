'use client'

type SubmissionEntry = { field: string; value: string }

export default function SubmissionDataCell({ cellData }: { cellData?: SubmissionEntry[] | null }) {
  if (!cellData || cellData.length === 0) {
    return <span style={{ color: '#9ca3af', fontSize: '0.8rem' }}>—</span>
  }

  const preview = cellData.slice(0, 3)
  const remaining = cellData.length - preview.length

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '3px', maxWidth: '320px' }}>
      {preview.map((entry, i) => (
        <div key={i} style={{ display: 'flex', gap: '6px', fontSize: '0.78rem', lineHeight: '1.4' }}>
          <span style={{
            fontWeight: 700, color: '#003087', whiteSpace: 'nowrap',
            minWidth: '80px', maxWidth: '110px', overflow: 'hidden', textOverflow: 'ellipsis',
          }}>
            {entry.field}:
          </span>
          <span style={{ color: '#374151', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', maxWidth: '180px' }}>
            {entry.value || <em style={{ color: '#9ca3af' }}>empty</em>}
          </span>
        </div>
      ))}
      {remaining > 0 && (
        <span style={{ fontSize: '0.72rem', color: '#9ca3af' }}>+{remaining} more field{remaining > 1 ? 's' : ''}</span>
      )}
    </div>
  )
}
