'use client'

import { useState } from 'react'

type FieldBase = { id?: string; name: string; label?: string | null; required?: boolean | null; width?: number | null }
type TextField     = FieldBase & { blockType: 'text' }
type EmailField    = FieldBase & { blockType: 'email' }
type TextareaField = FieldBase & { blockType: 'textarea' }
type NumberField   = FieldBase & { blockType: 'number' }
type CheckboxField = FieldBase & { blockType: 'checkbox' }
type SelectField   = FieldBase & { blockType: 'select'; options?: { label: string; value: string }[] | null }
type MessageField  = { id?: string; blockType: 'message'; message?: any }
type FormField = TextField | EmailField | TextareaField | NumberField | CheckboxField | SelectField | MessageField

type Form = {
  id: string
  title: string
  fields?: FormField[] | null
  confirmationType?: 'message' | 'redirect' | null
  confirmationMessage?: any
}

function validate(fields: FormField[], values: Record<string, string>): Record<string, string> {
  const errors: Record<string, string> = {}
  for (const field of fields) {
    if (field.blockType === 'message') continue
    const val = (values[field.name] ?? '').trim()
    if (field.required && !val) {
      errors[field.name] = `${field.label ?? field.name} is required`
      continue
    }
    if (field.blockType === 'email' && val && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(val)) {
      errors[field.name] = 'Enter a valid email address'
    }
    if (field.blockType === 'number' && val && isNaN(Number(val))) {
      errors[field.name] = 'Enter a valid number'
    }
  }
  return errors
}

export default function FormBlock({ form, onSuccess }: { form: Form; onSuccess?: () => void }) {
  const [values, setValues]   = useState<Record<string, string>>({})
  const [errors, setErrors]   = useState<Record<string, string>>({})
  const [loading, setLoading] = useState(false)
  const [submitted, setSubmitted] = useState(false)
  const [serverError, setServerError] = useState('')

  const fields = form.fields ?? []

  function set(name: string, value: string) {
    setValues((v) => ({ ...v, [name]: value }))
    setErrors((e) => { const n = { ...e }; delete n[name]; return n })
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    const errs = validate(fields, values)
    if (Object.keys(errs).length) { setErrors(errs); return }
    setLoading(true)
    setServerError('')
    try {
      const submissionData = fields
        .filter((f) => f.blockType !== 'message')
        .map((f) => ({ field: (f as FieldBase).name, value: values[(f as FieldBase).name] ?? '' }))

      const res = await fetch('/api/form-submissions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ form: form.id, submissionData }),
      })
      if (!res.ok) throw new Error('Submission failed')
      setSubmitted(true)
      onSuccess?.()
    } catch {
      setServerError('Something went wrong. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  if (submitted) {
    return (
      <div style={{
        background: '#dcfce7', border: '1px solid #86efac', borderRadius: '8px',
        padding: '24px', textAlign: 'center',
      }}>
        <div style={{ fontSize: '2rem', marginBottom: '12px' }}>✓</div>
        <h3 style={{ color: '#166534', marginBottom: '8px' }}>Thank you!</h3>
        <p style={{ color: '#166534', margin: 0 }}>Your submission has been received. We'll be in touch shortly.</p>
      </div>
    )
  }

  return (
    <form onSubmit={handleSubmit} noValidate>
      {fields.map((field, i) => {
        if (field.blockType === 'message') {
          return (
            <div key={field.id ?? i} style={{ marginBottom: '16px', color: 'var(--text-muted)', fontSize: '0.9rem' }}>
              {typeof field.message === 'string' ? field.message : null}
            </div>
          )
        }

        const f = field as FieldBase
        const err = errors[f.name]
        const inputStyle: React.CSSProperties = {
          padding: '10px 14px', border: `1.5px solid ${err ? '#ef4444' : 'var(--border)'}`,
          borderRadius: '8px', fontSize: '0.95rem', width: '100%',
          fontFamily: 'inherit', color: 'var(--text)', background: '#fff',
          outline: 'none', transition: 'border-color 0.15s',
        }

        return (
          <div key={f.name} style={{ marginBottom: '16px' }}>
            <label style={{ display: 'block', fontSize: '0.82rem', fontWeight: 600, color: 'var(--text)', marginBottom: '6px' }}>
              {f.label ?? f.name}
              {f.required && <span style={{ color: '#ef4444', marginLeft: '3px' }}>*</span>}
            </label>

            {field.blockType === 'textarea' && (
              <textarea
                name={f.name}
                required={!!f.required}
                value={values[f.name] ?? ''}
                onChange={(e) => set(f.name, e.target.value)}
                style={{ ...inputStyle, minHeight: '100px', resize: 'vertical' }}
              />
            )}

            {field.blockType === 'select' && (
              <select
                name={f.name}
                required={!!f.required}
                value={values[f.name] ?? ''}
                onChange={(e) => set(f.name, e.target.value)}
                style={inputStyle}
              >
                <option value="">Select…</option>
                {(field as SelectField).options?.map((opt) => (
                  <option key={opt.value} value={opt.value}>{opt.label}</option>
                ))}
              </select>
            )}

            {field.blockType === 'checkbox' && (
              <label style={{ display: 'flex', alignItems: 'center', gap: '8px', fontWeight: 400, fontSize: '0.95rem' }}>
                <input
                  type="checkbox"
                  name={f.name}
                  checked={values[f.name] === 'true'}
                  onChange={(e) => set(f.name, String(e.target.checked))}
                  style={{ width: '16px', height: '16px', cursor: 'pointer' }}
                />
                {f.label ?? f.name}
              </label>
            )}

            {(field.blockType === 'text' || field.blockType === 'email' || field.blockType === 'number') && (
              <input
                type={field.blockType}
                name={f.name}
                required={!!f.required}
                value={values[f.name] ?? ''}
                onChange={(e) => set(f.name, e.target.value)}
                style={inputStyle}
              />
            )}

            {err && <p style={{ color: '#ef4444', fontSize: '0.78rem', marginTop: '4px', marginBottom: 0 }}>{err}</p>}
          </div>
        )
      })}

      {serverError && (
        <p style={{ color: '#ef4444', fontSize: '0.88rem', marginBottom: '12px' }}>{serverError}</p>
      )}

      <button
        type="submit"
        disabled={loading}
        className="btn btn-primary"
        style={{ width: '100%', opacity: loading ? 0.7 : 1, cursor: loading ? 'not-allowed' : 'pointer' }}
      >
        {loading ? 'Submitting…' : 'Submit'}
      </button>
    </form>
  )
}
