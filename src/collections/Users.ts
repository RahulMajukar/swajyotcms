import type { CollectionConfig } from 'payload'

import { isSecureServerURL } from '../utilities/getServerURL'

export const Users: CollectionConfig = {
  slug: 'users',
  admin: {
    useAsTitle: 'email',
  },
  auth: {
    cookies: {
      // HTTP test/staging (e.g. test.swajyot.co.in) must not use Secure cookies
      secure: isSecureServerURL(),
      sameSite: 'Lax',
    },
    tokenExpiration: 7200,
  },
  fields: [
    // Email added by default
    {
      name: '_viewResponsesCell',
      type: 'ui',
      admin: {
        disableListColumn: true,
        components: {
          Cell:  '@/components/admin/ViewResponsesCell',
          Field: '@/components/admin/ViewResponsesCell',
        },
      },
    },
  ],
}
