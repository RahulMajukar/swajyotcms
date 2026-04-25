import type { CollectionConfig } from 'payload'
import { seoFields } from '../fields/seo'
import { slugField } from '../fields/slug'

export const Solutions: CollectionConfig = {
  slug: 'solutions',
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'category', 'updatedAt'],
    group: 'Content',
    preview: (doc) =>
      doc?.slug ? `${process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'}/solutions/${doc.slug}` : null,
  },
  versions: {
    drafts: true,
  },
  fields: [
    {
      name: 'title',
      type: 'text',
      required: true,
    },
    slugField(),
    {
      name: 'category',
      type: 'select',
      required: true,
      admin: {
        position: 'sidebar',
      },
      options: [
        { label: 'Analytics & AI', value: 'analytics-ai' },
        { label: 'Enterprise Computing', value: 'enterprise-computing' },
        { label: 'Digital Process Automation', value: 'digital-process-automation' },
        { label: 'Quality Management', value: 'quality-management' },
        { label: 'Information Management', value: 'information-management' },
        { label: 'Manufacturing', value: 'manufacturing' },
        { label: 'Service Excellence', value: 'service-excellence' },
      ],
    },
    {
      name: 'shortDescription',
      type: 'textarea',
      required: true,
      admin: {
        description: 'Shown in solution listing cards (1–2 sentences).',
      },
    },
    {
      name: 'description',
      type: 'richText',
      label: 'Full Description',
    },
    {
      name: 'coverImage',
      type: 'upload',
      relationTo: 'media',
    },
    {
      name: 'icon',
      type: 'upload',
      relationTo: 'media',
      admin: {
        description: 'SVG or PNG icon displayed alongside the solution title.',
      },
    },
    {
      name: 'highlights',
      type: 'array',
      label: 'Key Highlights',
      admin: {
        description: 'Bullet points shown on the solution detail page.',
      },
      fields: [
        {
          name: 'point',
          type: 'text',
          required: true,
        },
      ],
    },
    {
      name: 'industries',
      type: 'relationship',
      relationTo: 'industries',
      hasMany: true,
      admin: {
        position: 'sidebar',
        description: 'Industries this solution applies to.',
      },
    },
    seoFields,
  ],
}
