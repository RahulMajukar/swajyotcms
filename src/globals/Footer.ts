import type { GlobalConfig } from 'payload'

export const Footer: GlobalConfig = {
  slug: 'footer',
  label: 'Footer',
  admin: {
    group: 'Settings',
  },
  fields: [
    {
      name: 'columns',
      type: 'array',
      label: 'Link Columns',
      fields: [
        {
          name: 'heading',
          type: 'text',
          required: true,
        },
        {
          name: 'links',
          type: 'array',
          fields: [
            { name: 'label', type: 'text', required: true },
            { name: 'url', type: 'text', required: true },
          ],
        },
      ],
    },
    {
      name: 'copyright',
      type: 'text',
      defaultValue: '© 2024 Swajyot Technologies Pvt. Ltd. All rights reserved.',
    },
    {
      name: 'bottomLinks',
      type: 'array',
      label: 'Bottom Bar Links (Privacy, Terms, etc.)',
      fields: [
        { name: 'label', type: 'text', required: true },
        { name: 'url', type: 'text', required: true },
      ],
    },
  ],
}
