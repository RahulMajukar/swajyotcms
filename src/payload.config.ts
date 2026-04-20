import { postgresAdapter } from '@payloadcms/db-postgres'
import { lexicalEditor } from '@payloadcms/richtext-lexical'
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

import { SiteSettings } from './globals/SiteSettings'
import { MainNav } from './globals/MainNav'
import { Footer } from './globals/Footer'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
  admin: {
    user: Users.slug,
    importMap: {
      baseDir: path.resolve(dirname),
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
  plugins: [],
})
