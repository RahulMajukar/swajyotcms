import type { GlobalConfig } from 'payload'

export const SiteSettings: GlobalConfig = {
  slug: 'site-settings',
  label: 'Site Settings',
  admin: {
    group: 'Settings',
  },
  fields: [
    {
      name: 'companyName',
      type: 'text',
      required: true,
      defaultValue: 'Swajyot Technologies Pvt. Ltd.',
    },
    {
      name: 'tagline',
      type: 'text',
      defaultValue: 'Always Creating Value',
    },
    {
      type: 'row',
      fields: [
        {
          name: 'email',
          type: 'email',
          defaultValue: 'info@swajyot.co.in',
        },
        {
          name: 'phone',
          type: 'text',
          defaultValue: '+91-80-4010 9777 / 88',
        },
      ],
    },
    {
      name: 'address',
      type: 'group',
      fields: [
        { name: 'line1', type: 'text', defaultValue: "#5, 7th 'C' Cross, Ashwini Layout" },
        { name: 'line2', type: 'text', defaultValue: 'Koramangala Intermediate Road' },
        { name: 'city', type: 'text', defaultValue: 'Bengaluru' },
        { name: 'state', type: 'text', defaultValue: 'Karnataka' },
        { name: 'pincode', type: 'text', defaultValue: '560047' },
        { name: 'country', type: 'text', defaultValue: 'India' },
      ],
    },
    {
      name: 'officeHours',
      type: 'array',
      fields: [
        { name: 'days', type: 'text', required: true },
        { name: 'hours', type: 'text', required: true },
      ],
    },
    {
      name: 'social',
      type: 'group',
      label: 'Social Media Links',
      fields: [
        { name: 'linkedin', type: 'text', label: 'LinkedIn URL' },
        { name: 'twitter', type: 'text', label: 'Twitter / X URL' },
        { name: 'facebook', type: 'text', label: 'Facebook URL' },
        { name: 'instagram', type: 'text', label: 'Instagram URL' },
        { name: 'youtube', type: 'text', label: 'YouTube URL' },
        { name: 'pinterest', type: 'text', label: 'Pinterest URL' },
      ],
    },
    {
      name: 'logo',
      type: 'upload',
      relationTo: 'media',
    },
    {
      name: 'favicon',
      type: 'upload',
      relationTo: 'media',
    },
    {
      name: 'defaultSEO',
      type: 'group',
      label: 'Default SEO (fallback for all pages)',
      fields: [
        {
          name: 'metaTitle',
          type: 'text',
          defaultValue: 'Swajyot Technologies – Digital Transformation Solutions',
        },
        {
          name: 'metaDescription',
          type: 'textarea',
          defaultValue:
            'Swajyot Technologies delivers enterprise-grade Analytics & AI, Digital Process Automation, and Computing Management solutions across Manufacturing, Pharma, Healthcare, and Energy sectors.',
        },
        {
          name: 'ogImage',
          type: 'upload',
          relationTo: 'media',
          label: 'Default Social Share Image',
        },
      ],
    },
  ],
}
