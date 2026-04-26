import { getPayload } from 'payload'
import configPromise from '@payload-config'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import FormBlock from '@/components/FormBlock'

type Params = { params: Promise<{ slug: string }> }

type PublicForm = {
  id: string
  title: string
  description?: string | null
  fields?: any[] | null
  confirmationType?: string | null
  confirmationMessage?: any
  seo?: { metaTitle?: string | null; metaDescription?: string | null } | null
}

async function getForm(slug: string): Promise<PublicForm | null> {
  const payload = await getPayload({ config: configPromise })
  const result = await payload.find({
    collection: 'forms',
    where: { slug: { equals: slug } },
    depth: 1,
    limit: 1,
  })
  return (result.docs[0] as unknown as PublicForm) ?? null
}

export async function generateMetadata({ params }: Params): Promise<Metadata> {
  const { slug } = await params
  const form = await getForm(slug)
  if (!form) return {}
  return {
    title: form.seo?.metaTitle || form.title,
    description: form.seo?.metaDescription || form.description || undefined,
  }
}

export default async function PublicFormPage({ params }: Params) {
  const { slug } = await params
  const form = await getForm(slug)
  if (!form) notFound()

  return (
    <>
      <div className="page-header">
        <div className="container">
          <div className="breadcrumb">
            <a href="/">Home</a>
            <span>›</span>
            <span>Forms</span>
          </div>
          <h1>{form.title}</h1>
          {form.description && <p>{form.description}</p>}
        </div>
      </div>

      <section className="section section--soft">
        <div className="container">
          <div style={{ maxWidth: '680px', margin: '0 auto' }}>
            <div className="form-card">
              <FormBlock form={form as any} />
            </div>
          </div>
        </div>
      </section>
    </>
  )
}
