import type { GlobalConfig } from 'payload'

export const MainNav: GlobalConfig = {
  slug: 'main-nav',
  label: 'Main Navigation',
  admin: {
    group: 'Settings',
  },
  fields: [
    {
      name: 'items',
      type: 'array',
      label: 'Menu Items',
      admin: {
        description:
          'Top-level navigation items. Add children for dropdown menus.',
      },
      fields: [
        {
          name: 'label',
          type: 'text',
          required: true,
        },
        {
          name: 'link',
          type: 'text',
          admin: {
            description: 'Leave empty if this item opens a dropdown only.',
          },
        },
        {
          name: 'children',
          type: 'array',
          label: 'Dropdown Items',
          fields: [
            { name: 'label', type: 'text', required: true },
            { name: 'link', type: 'text', required: true },
            {
              name: 'description',
              type: 'text',
              admin: {
                description: 'Optional subtitle shown in mega menus.',
              },
            },
          ],
        },
      ],
    },
  ],
}
