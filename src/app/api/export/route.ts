import { getPayload } from 'payload'
import configPromise from '@payload-config'
import { NextRequest, NextResponse } from 'next/server'
import * as XLSX from 'xlsx'

export async function GET(req: NextRequest) {
  const payload = await getPayload({ config: configPromise })

  // Auth check — must be logged-in admin
  const { user } = await payload.auth({ headers: req.headers })
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const { searchParams } = new URL(req.url)
  const formId   = searchParams.get('formId')
  const dateFrom = searchParams.get('dateFrom')
  const dateTo   = searchParams.get('dateTo')
  const format   = searchParams.get('format') ?? 'csv'

  const where: Record<string, any> = {}
  if (formId) where.form = { equals: formId }
  if (dateFrom || dateTo) {
    where.createdAt = {}
    if (dateFrom) where.createdAt.greater_than = dateFrom
    if (dateTo)   where.createdAt.less_than    = dateTo
  }
  const { docs } = await payload.find({
    collection: 'form-submissions',
    where,
    limit: 10000,
    depth: 1,
  })

  if (!docs.length) {
    return NextResponse.json({ error: 'No submissions found' }, { status: 404 })
  }

  // Collect all unique field names across submissions
  const allFields = new Set<string>()
  docs.forEach((doc) => {
    (doc.submissionData ?? []).forEach((d: any) => allFields.add(d.field))
  })
  const fieldNames = Array.from(allFields)

  // Build rows
  const rows = docs.map((doc) => {
    const dataMap: Record<string, string> = {}
    ;(doc.submissionData ?? []).forEach((d: any) => { dataMap[d.field] = d.value })
    return {
      'Submitted At': new Date(doc.createdAt).toLocaleString('en-IN'),
      'Form': typeof doc.form === 'object' ? (doc.form as any).title ?? '' : doc.form,
      ...Object.fromEntries(fieldNames.map((f) => [f, dataMap[f] ?? ''])),
    }
  })

  const worksheet = XLSX.utils.json_to_sheet(rows)
  const workbook  = XLSX.utils.book_new()
  XLSX.utils.book_append_sheet(workbook, worksheet, 'Submissions')

  if (format === 'excel') {
    const buffer = XLSX.write(workbook, { type: 'buffer', bookType: 'xlsx' })
    return new NextResponse(buffer, {
      headers: {
        'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'Content-Disposition': `attachment; filename="submissions.xlsx"`,
      },
    })
  }

  // Default: CSV
  const csv = XLSX.utils.sheet_to_csv(worksheet)
  return new NextResponse(csv, {
    headers: {
      'Content-Type': 'text/csv',
      'Content-Disposition': `attachment; filename="submissions.csv"`,
    },
  })
}
