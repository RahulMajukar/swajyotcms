import type { CollectionConfig } from 'payload'
import { seoFields } from '../fields/seo'
import { slugField } from '../fields/slug'

export const Webinars: CollectionConfig = {
  slug: 'webinars',
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'eventStatus', 'date', 'updatedAt'],
    group: 'Content',
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
      name: 'eventStatus',
      type: 'select',
      required: true,
      defaultValue: 'upcoming',
      label: 'Event Status',
      admin: {
        position: 'sidebar',
      },
      options: [
        { label: 'Upcoming', value: 'upcoming' },
        { label: 'Live', value: 'live' },
        { label: 'Past / Recording Available', value: 'past' },
        { label: 'Coming Soon', value: 'coming-soon' },
      ],
    },
    {
      name: 'date',
      type: 'date',
      admin: {
        position: 'sidebar',
        date: {
          pickerAppearance: 'dayAndTime',
        },
      },
    },
    {
      name: 'shortDescription',
      type: 'textarea',
      required: true,
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
      name: 'registrationForm',
      type: 'relationship',
      relationTo: 'forms',
      label: 'Registration Form (embed on page)',
      admin: {
        position: 'sidebar',
        description: 'Select a form to show a registration modal on this webinar page. Takes priority over the URL below.',
      },
    },
    {
      name: 'registrationUrl',
      type: 'text',
      label: 'Registration URL (external fallback)',
      admin: {
        description: 'Used only if no Registration Form is selected above.',
      },
    },
    {
      name: 'recordingUrl',
      type: 'text',
      label: 'Recording URL',
      admin: {
        condition: (data) => data?.eventStatus === 'past',
      },
    },
    {
      name: 'partner',
      type: 'relationship',
      relationTo: 'partners',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'speakers',
      type: 'array',
      fields: [
        { name: 'name', type: 'text', required: true },
        { name: 'role', type: 'text' },
        { name: 'photo', type: 'upload', relationTo: 'media' },
      ],
    },
    seoFields,
  ],
}
