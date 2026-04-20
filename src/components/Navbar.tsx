import { getPayload } from 'payload'
import configPromise from '@payload-config'
import NavbarClient, { type NavItem } from './NavbarClient'

export default async function Navbar() {
  const payload = await getPayload({ config: configPromise })
  const [settings, mainNav] = await Promise.all([
    payload.findGlobal({ slug: 'site-settings' }),
    payload.findGlobal({ slug: 'main-nav' }),
  ])

  const items: NavItem[] = (mainNav.items ?? []).map((item) => ({
    label: item.label,
    link:  item.link ?? undefined,
    children: (item.children ?? []).map((child) => ({
      label:       child.label,
      link:        child.link,
      description: child.description ?? undefined,
    })),
  }))

  return (
    <NavbarClient
      companyName={settings.companyName ?? 'Swajyot'}
      items={items}
    />
  )
}
