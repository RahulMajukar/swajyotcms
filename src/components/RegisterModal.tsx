'use client'

import { useState, useEffect } from 'react'
import FormBlock from './FormBlock'

type Form = {
  id: string
  title: string
  fields?: any[] | null
  confirmationType?: 'message' | 'redirect' | null
  confirmationMessage?: any
}

export default function RegisterModal({ form, label = 'Register Now' }: { form: Form; label?: string }) {
  const [open, setOpen] = useState(false)

  useEffect(() => {
    if (open) document.body.style.overflow = 'hidden'
    else document.body.style.overflow = ''
    return () => { document.body.style.overflow = '' }
  }, [open])

  return (
    <>
      <button className="btn btn-primary" onClick={() => setOpen(true)}>{label}</button>

      {open && (
        <div
          onClick={(e) => { if (e.target === e.currentTarget) setOpen(false) }}
          style={{
            position: 'fixed', inset: 0, zIndex: 9999,
            background: 'rgba(0,0,0,0.6)', backdropFilter: 'blur(4px)',
            display: 'flex', alignItems: 'center', justifyContent: 'center',
            padding: '24px',
          }}
        >
          <div style={{
            background: '#fff', borderRadius: '12px', width: '100%', maxWidth: '520px',
            maxHeight: '90vh', overflowY: 'auto', padding: '36px', position: 'relative',
            boxShadow: '0 20px 60px rgba(0,0,0,0.3)',
          }}>
            <button
              onClick={() => setOpen(false)}
              style={{
                position: 'absolute', top: '16px', right: '16px',
                background: 'none', border: 'none', fontSize: '1.4rem',
                cursor: 'pointer', color: '#6b7280', lineHeight: 1,
              }}
              aria-label="Close"
            >
              ×
            </button>
            <h2 style={{ marginBottom: '8px', fontSize: '1.3rem' }}>{form.title}</h2>
            <p style={{ fontSize: '0.88rem', color: 'var(--text-muted)', marginBottom: '24px' }}>
              Fill in your details and we'll confirm your spot.
            </p>
            <FormBlock form={form} onSuccess={() => setTimeout(() => setOpen(false), 3000)} />
          </div>
        </div>
      )}
    </>
  )
}
