import type { CollectionConfig } from 'payload'
import { seoFields } from '../fields/seo'
import { slugField } from '../fields/slug'

export const Partners: CollectionConfig = {
  slug: 'partners',
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'category', 'updatedAt'],
    group: 'Content',
  },
  fields: [
    {
      name: 'name',
      type: 'text',
      required: true,
    },
    slugField('name'),
    {
      name: 'category',
      type: 'select',
      required: true,
      admin: {
        position: 'sidebar',
      },
      options: [
        { label: 'Data Analytics', value: 'data-analytics' },
        { label: 'Enterprise Computing', value: 'enterprise-computing' },
        { label: 'Product Lifecycle Management', value: 'plm' },
        { label: 'Automation', value: 'automation' },
        { label: 'Other', value: 'other' },
      ],
    },
    {
      name: 'logo',
      type: 'upload',
      relationTo: 'media',
      required: true,
    },
    {
      name: 'description',
      type: 'textarea',
      admin: {
        description: 'Short description shown in the partners listing.',
      },
    },
    {
      name: 'detailContent',
      type: 'richText',
      label: 'Detail Page Content',
      admin: {
        description: 'Full content shown on the partner detail page (/explore/partners/slug/).',
      },
    },
    {
      name: 'website',
      type: 'text',
      label: 'Website URL',
    },
    {
      name: 'featuredSolutions',
      type: 'relationship',
      relationTo: 'solutions',
      hasMany: true,
      admin: {
        position: 'sidebar',
        description: 'Solutions this partner supports.',
      },
    },
    seoFields,
  ],
}
