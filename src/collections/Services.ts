import type { CollectionConfig } from 'payload'
import { seoFields } from '../fields/seo'
import { slugField } from '../fields/slug'

export const Services: CollectionConfig = {
  slug: 'services',
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'updatedAt'],
    group: 'Content',
    preview: (doc) =>
      doc?.slug ? `${process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'}/services/${doc.slug}` : null,
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
      name: 'shortDescription',
      type: 'textarea',
      required: true,
      admin: {
        description: 'Shown in service listing cards (1–2 sentences).',
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
    },
    {
      name: 'highlights',
      type: 'array',
      label: 'Key Highlights',
      fields: [
        {
          name: 'point',
          type: 'text',
          required: true,
        },
      ],
    },
    {
      name: 'relatedSolutions',
      type: 'relationship',
      relationTo: 'solutions',
      hasMany: true,
      admin: {
        position: 'sidebar',
      },
    },
    seoFields,
  ],
}
