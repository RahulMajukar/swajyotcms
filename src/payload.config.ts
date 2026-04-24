import { postgresAdapter } from '@payloadcms/db-postgres'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
import { formBuilderPlugin } from '@payloadcms/plugin-form-builder'
import path from 'path'
import { buildConfig } from 'payload'
import { fileURLToPath } from 'url'
import sharp from 'sharp'

import { Users } from './collections/Users'
import { Media } from './collections/Media'
import { Solutions } from './collections/Solutions'
import { Services } from './collections/Services'
import { Industries } from './collections/Industries'
import { Partners } from './collections/Partners'
import { Webinars } from './collections/Webinars'
import { Team } from './collections/Team'
import { ContactSubmissions } from './collections/ContactSubmissions'
import { Pages } from './collections/Pages'

import { SiteSettings } from './globals/SiteSettings'
import { MainNav } from './globals/MainNav'
import { Footer } from './globals/Footer'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
  serverURL: process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000',
  admin: {
    user: Users.slug,
    importMap: {
      baseDir: path.resolve(dirname),
    },
    components: {
      graphics: {
        Logo: '@/components/admin/AdminLogo',
        Icon: '@/components/admin/AdminIcon',
      },
      afterNavLinks: ['@/components/admin/SubmissionsBeforeList'],
      views: {
        formResponses: {
          Component: '@/components/admin/FormResponsesView',
          path: '/form-responses',
        },
      },
    },
  },
  collections: [
    // Auth
    Users,
    // Assets
    Media,
    // Content
    Solutions,
    Services,
    Industries,
    Partners,
    Webinars,
    Team,
    // Admin
    ContactSubmissions,
    // Static pages
    Pages,
  ],
  globals: [
    SiteSettings,
    MainNav,
    Footer,
  ],
  editor: lexicalEditor(),
  secret: process.env.PAYLOAD_SECRET || '',
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  db: postgresAdapter({
    pool: {
      connectionString: process.env.DATABASE_URL || '',
    },
  }),
  sharp,
  plugins: [
    formBuilderPlugin({
      fields: {
        text: true,
        textarea: true,
        select: true,
        email: true,
        checkbox: true,
        number: true,
        message: true,
        payment: false,
        state: false,
        country: false,
      },
      formOverrides: {
        admin: { group: 'Forms' },
        access: { read: () => true },
      },
      formSubmissionOverrides: {
        admin: {
          group: 'Forms',
          defaultColumns: ['form', 'createdAt', 'viewResponses'],
        },
        fields: [
          {
            name: 'viewResponses',
            type: 'ui',
            admin: {
              components: {
                Cell: '@/components/admin/ViewResponsesCell',
                Field: '@/components/admin/ViewResponsesCell',
              },
            },
          },
        ],
      },
      redirectRelationships: ['pages'],
    }),
  ],
})
