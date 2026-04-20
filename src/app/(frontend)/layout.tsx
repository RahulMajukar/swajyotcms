import React from 'react'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import type { Metadata } from 'next'
import Navbar from '@/components/Navbar'
import Footer from '@/components/Footer'
import './styles.css'

export async function generateMetadata(): Promise<Metadata> {
  const payload = await getPayload({ config: configPromise })
  const settings = await payload.findGlobal({ slug: 'site-settings' })
  return {
    title: {
      default: settings.defaultSEO?.metaTitle ?? 'Swajyot Technologies',
      template: `%s | ${settings.companyName ?? 'Swajyot Technologies'}`,
    },
    description: settings.defaultSEO?.metaDescription ?? undefined,
  }
}

export default async function FrontendLayout({ children }: { children: React.ReactNode }) {
  const payload = await getPayload({ config: configPromise })
  const settings = await payload.findGlobal({ slug: 'site-settings' })

  return (
    <html lang="en">
      <body>
        <Navbar companyName={settings.companyName ?? 'Swajyot'} />
        <main>{children}</main>
        <Footer />
      </body>
    </html>
  )
}
