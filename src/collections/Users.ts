import type { CollectionConfig } from 'payload'

export const Users: CollectionConfig = {
  slug: 'users',
  admin: {
    useAsTitle: 'email',
  },
  auth: true,
  fields: [
    // Email added by default
    {
      name: '_viewResponsesCell',
      type: 'ui',
      admin: {
        disableListColumn: true,
        disableListFilter: true,
        components: {
          Cell:  '@/components/admin/ViewResponsesCell',
          Field: '@/components/admin/ViewResponsesCell',
        },
      },
    },
  ],
}
