# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This project uses the Payload CMS skill at `.claude/skills/payload/`.
Start with `.claude/skills/payload/SKILL.md` for a quick reference, then see `.claude/skills/payload/reference/` for detailed docs.

## Commands

```bash
pnpm dev              # Start dev server (http://localhost:3000)
pnpm devsafe          # Clear .next cache and start dev server (uses npx rimraf, Windows-safe)
pnpm build            # Production build
pnpm lint             # ESLint
pnpm generate:types   # Regenerate src/payload-types.ts from config
pnpm generate:importmap  # Regenerate Payload import map

# Tests
pnpm test:int         # Integration tests (Vitest, tests/int/**/*.int.spec.ts)
pnpm test:e2e         # E2E tests (Playwright, tests/e2e/)
pnpm test             # Both int and e2e

# Run a single integration test file
pnpm vitest run --config ./vitest.config.mts tests/int/api.int.spec.ts

# Force-regenerate import map (when "No new imports found" is stuck)
rm src/app/(payload)/admin/importMap.js && pnpm generate:importmap
```

## Architecture

**Payload CMS 3.x embedded in Next.js App Router.** The CMS admin and API run inside the Next.js app via `@payloadcms/next`.

- [src/payload.config.ts](src/payload.config.ts) — central Payload config: collections, globals, editor, DB adapter, plugins, custom admin components
- [src/collections/](src/collections/) — each file exports a `CollectionConfig`; import and add to `collections[]` in `payload.config.ts`
- [src/globals/](src/globals/) — `SiteSettings`, `MainNav`, `Footer` — fetched server-side in layout components
- [src/payload-types.ts](src/payload-types.ts) — auto-generated TypeScript types; regenerate with `pnpm generate:types`
- [src/app/(payload)/](src/app/(payload)/) — Next.js route group mounting Payload admin UI and REST/GraphQL API
- [next.config.ts](next.config.ts) — wraps config with `withPayload()`

**Database:** PostgreSQL via `@payloadcms/db-postgres`. `DATABASE_URL` env var.

**Rich text:** Lexical editor (`@payloadcms/richtext-lexical`).

**Media uploads:** `Media` collection; images served at `/api/media/file/**`; `sharp` for resizing.

**Static assets:** Logos and other static files live in `public/images/`. Served at `/images/...`.
- `logo-blue.png` — blue logo for light backgrounds (frontend, admin login)
- `logo-side.png` — white logo with tagline for dark backgrounds (navbar, footer)

**Environment variables required:**
- `DATABASE_URL` — PostgreSQL connection string
- `PAYLOAD_SECRET` — secret key for Payload auth/encryption
- `NEXT_PUBLIC_SERVER_URL` — must match the running server (e.g. `http://localhost:3000`); used by Payload to generate media URLs

## Collections

| Slug | Purpose |
|------|---------|
| `users` | Auth; holds hidden `_viewResponsesCell` ui field to register `ViewResponsesCell` in import map |
| `media` | File uploads |
| `solutions` | Solutions listing |
| `services` | Services listing with rich-text content |
| `industries` | Industry verticals |
| `partners` | Partner logos/links |
| `webinars` | Webinar events; has `registrationForm` relationship to `forms` (form-builder) |
| `contact-submissions` | Manual contact form submissions |
| `pages` | Static pages (Privacy Policy, Terms, etc.) with draft support |
| `forms` | Created by `formBuilderPlugin`; group "Forms" |
| `form-submissions` | Created by `formBuilderPlugin`; group "Forms"; has custom `viewResponses` UI column |

## Globals

| Slug | Purpose |
|------|---------|
| `site-settings` | Logo upload, contact info, social links — fetched by Navbar and Footer |
| `main-nav` | Navigation links |
| `footer` | Footer columns, brand description, address/social toggle |

## Form Builder

Uses `@payloadcms/plugin-form-builder`. Admin creates forms in the "Forms" group; submissions stored in "Form Submissions".

- **Frontend rendering:** `src/components/FormBlock.tsx` — client component, validates required/email/number, submits to `POST /api/form-submissions`
- **Webinar modal:** `src/components/RegisterModal.tsx` — wraps FormBlock in a modal overlay; used on webinar detail pages when `registrationForm` is set
- **Export API:** `src/app/api/export/route.ts` — GET handler, auth-gated; params `formId`, `dateFrom`, `dateTo`, `format` (csv/excel); uses `xlsx` package
- **Form Responses admin page:** `src/components/admin/FormResponsesView.tsx` — full custom admin view at `/admin/form-responses` with filters, pagination, table, export buttons
- **Sidebar link:** `src/components/admin/SubmissionsBeforeList.tsx` — "📊 Form Responses" link injected via `admin.components.afterNavLinks`
- **Table cell:** `src/components/admin/ViewResponsesCell.tsx` — "View Responses →" link in Form Submissions list; registered via hidden ui field on `Users` collection

## Import Map — Critical Constraint

**The Payload import map scanner only scans:**
1. `admin.components.*` at the top level of `buildConfig()`
2. Fields on collections listed directly in `collections[]`

**It does NOT scan inside `plugins[]`.** Components registered only through plugin configs (e.g. `formSubmissionOverrides`) will silently fail to appear.

**Workaround pattern used in this project:**
- Components needed in the admin UI but only referenced via plugins are registered through scanned paths:
  - `SubmissionsBeforeList` → `admin.components.afterNavLinks`
  - `ViewResponsesCell` → hidden `type: 'ui'` field on `Users` collection with `disableListColumn: true`

After adding any new admin component, run `pnpm generate:importmap`. If you see "No new imports found, skipping writing import map", delete the file first: `rm src/app/(payload)/admin/importMap.js && pnpm generate:importmap`.

## Admin Customization

- `src/components/admin/AdminLogo.tsx` — logo shown on admin login page
- `src/components/admin/AdminIcon.tsx` — icon shown in admin sidebar
- Admin uses Payload CSS variables: `--theme-bg`, `--theme-elevation-0`, `--theme-elevation-50`, `--theme-elevation-100`, `--theme-border-color`, `--theme-text`, `--theme-text-dim`, `--theme-input-bg`

## Frontend Components

- `src/components/Navbar.tsx` — server component; fetches `site-settings` (depth 1) for logo; passes `logoUrl` to `NavbarClient`
- `src/components/NavbarClient.tsx` — client component; handles mobile menu, scroll behavior
- `src/components/Footer.tsx` — server component; fetches both `site-settings` and `footer` globals; dynamic column grid via inline style
- `src/components/RichText.tsx` — renders Lexical rich text from Payload
- `src/components/PayloadImage.tsx` — wraps Next.js `<Image>` for Payload media objects

## Testing

- Integration tests (`tests/int/`) use Vitest + jsdom, instantiate Payload directly via `getPayload({ config })` — require a live database.
- E2E tests (`tests/e2e/`) use Playwright against a running dev server on port 3000.
- Helper utilities in `tests/helpers/` for seeding users and logging in.
