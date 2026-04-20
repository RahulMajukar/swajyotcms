import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'

export const metadata = {
  title: 'Services',
  description: 'Software Development, Analytics Outsourcing, UI/UX Design and more technology services.',
}

export default async function ServicesPage() {
  const payload = await getPayload({ config: configPromise })
  const { docs: services } = await payload.find({
    collection: 'services',
    where: { _status: { equals: 'published' } },
    sort: 'title',
  })

  return (
    <>
      <section>
        <h1>Our Services</h1>
        <p>
          We deliver best-in-class technology services tailored to your business environment,
          from software development to analytics outsourcing.
        </p>
      </section>

      <section>
        <ul>
          {services.map((s) => (
            <li key={s.id}>
              <Link href={`/services/${s.slug}`}>
                <h2>{s.title}</h2>
                <p>{s.shortDescription}</p>
              </Link>
            </li>
          ))}
        </ul>
        {services.length === 0 && <p>Services coming soon.</p>}
      </section>
    </>
  )
}
