import type { CollectionConfig } from 'payload'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
import { slugField } from '../fields/slug'
import { seoFields } from '../fields/seo'

export const Pages: CollectionConfig = {
  slug: 'pages',
  labels: { singular: 'Page', plural: 'Pages' },
  admin: {
    group: 'Content',
    useAsTitle: 'title',
    defaultColumns: ['title', 'slug', '_status', 'updatedAt'],
    description: 'Static pages like Privacy Policy, Terms of Service, etc.',
    preview: (doc) =>
      doc?.slug ? `${process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'}/pages/${doc.slug}` : null,
  },
  access: {
    read: ({ req }) => {
      // Published pages are public; drafts only for logged-in users
      if (req.user) return true
      return { _status: { equals: 'published' } }
    },
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
    slugField('title'),
    {
      name: 'content',
      type: 'richText',
      editor: lexicalEditor(),
      required: true,
    },
    seoFields,
  ],
}
