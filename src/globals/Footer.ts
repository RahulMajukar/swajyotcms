import type { GlobalConfig } from 'payload'

export const Footer: GlobalConfig = {
  slug: 'footer',
  label: 'Footer',
  admin: {
    group: 'Settings',
  },
  fields: [
    {
      name: 'brandDescription',
      type: 'textarea',
      label: 'Brand Description (shown below company name)',
      defaultValue:
        'Over 10 years helping companies reach their financial and branding goals through Digital Transformation Solutions & Services.',
      admin: {
        description: 'Short paragraph shown in the first column of the footer.',
      },
    },
    {
      name: 'showAddress',
      type: 'checkbox',
      label: 'Show office address in footer',
      defaultValue: true,
    },
    {
      name: 'showSocial',
      type: 'checkbox',
      label: 'Show social media icons in footer',
      defaultValue: true,
    },
    {
      name: 'columns',
      type: 'array',
      label: 'Link Columns',
      admin: {
        description: 'Add up to 4 columns of footer links (e.g. Solutions, Services, Company).',
      },
      maxRows: 4,
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
            { name: 'url',   type: 'text', required: true },
          ],
        },
      ],
    },
    {
      name: 'copyright',
      type: 'text',
      label: 'Copyright Text',
      admin: {
        description: 'Leave blank to auto-generate from company name and current year.',
        placeholder: '© 2026 Swajyot Technologies Pvt. Ltd. All rights reserved.',
      },
    },
    {
      name: 'bottomLinks',
      type: 'array',
      label: 'Bottom Bar Links (Privacy Policy, Terms, etc.)',
      fields: [
        { name: 'label', type: 'text', required: true },
        { name: 'url',   type: 'text', required: true },
      ],
    },
  ],
}
