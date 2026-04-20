# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This project uses the Payload CMS skill at `.claude/skills/payload/`.
Start with `.claude/skills/payload/SKILL.md` for a quick reference, then see `.claude/skills/payload/reference/` for detailed docs.

## Commands

```bash
pnpm dev              # Start dev server (http://localhost:3000)
pnpm devsafe          # Clear .next cache and start dev server
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
```

## Architecture

**Payload CMS 3.x embedded in Next.js App Router.** The CMS admin and API run inside the Next.js app via `@payloadcms/next`.

- [src/payload.config.ts](src/payload.config.ts) — central Payload config: collections, editor, DB adapter, plugins
- [src/collections/](src/collections/) — each file exports a `CollectionConfig`; import and add to `collections[]` in `payload.config.ts`
- [src/payload-types.ts](src/payload-types.ts) — auto-generated TypeScript types; do not edit manually, regenerate with `pnpm generate:types`
- [src/app/(payload)/](src/app/(payload)/) — Next.js route group that mounts Payload's admin UI and REST/GraphQL API routes
- [src/app/my-route/route.ts](src/app/my-route/route.ts) — example custom Next.js API route using `getPayload({ config })`
- [next.config.ts](next.config.ts) — wraps config with `withPayload()`; `.js` → `.ts/.tsx` extension aliasing for webpack; Turbopack root set to project root

**Database:** PostgreSQL via `@payloadcms/db-postgres`. Connection string from `DATABASE_URL` env var.

**Rich text:** Lexical editor (`@payloadcms/richtext-lexical`).

**Media uploads:** `Media` collection has `upload: true`; images served at `/api/media/file/**`; `sharp` used for resizing.

**Environment variables required:**
- `DATABASE_URL` — PostgreSQL connection string
- `PAYLOAD_SECRET` — secret key for Payload auth/encryption

## Testing

- Integration tests (`tests/int/`) use Vitest + jsdom and instantiate Payload directly via `getPayload({ config })` — they require a live database.
- E2E tests (`tests/e2e/`) use Playwright against a running dev server (`pnpm dev` on port 3000).
- Helper utilities in `tests/helpers/` for seeding users and logging in.
