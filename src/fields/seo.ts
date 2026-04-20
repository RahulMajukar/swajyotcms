import type { Field } from 'payload'

export const seoFields: Field = {
  name: 'seo',
  type: 'group',
  label: 'SEO',
  admin: {
    position: 'sidebar',
  },
  fields: [
    {
      name: 'metaTitle',
      type: 'text',
      admin: {
        description: '50–60 characters recommended.',
      },
    },
    {
      name: 'metaDescription',
      type: 'textarea',
      admin: {
        description: '150–160 characters recommended.',
      },
    },
    {
      name: 'ogImage',
      type: 'upload',
      relationTo: 'media',
      label: 'Social Share Image',
    },
    {
      name: 'noIndex',
      type: 'checkbox',
      defaultValue: false,
      label: 'Hide from search engines (noindex)',
    },
  ],
}
