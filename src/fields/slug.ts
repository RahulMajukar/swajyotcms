import type { Field } from 'payload'

export const slugField = (sourceField: string = 'title'): Field => ({
  name: 'slug',
  type: 'text',
  unique: true,
  index: true,
  admin: {
    position: 'sidebar',
    description: 'Auto-generated from the title. Edit to override.',
  },
  hooks: {
    beforeValidate: [
      ({ value, data }) => {
        // Always slugify: use submitted value if present, otherwise fall back to source field
        const raw = ((value as string) || (data?.[sourceField] as string) || '').trim()
        if (!raw) return value
        return raw
          .toLowerCase()
          .replace(/[^\w\s-]/g, '')   // strip special chars (|, &, etc.)
          .replace(/[\s_]+/g, '-')    // spaces/underscores → dash
          .replace(/-{2,}/g, '-')     // collapse multiple dashes
          .replace(/^-+|-+$/g, '')    // trim leading/trailing dashes
      },
    ],
  },
})
