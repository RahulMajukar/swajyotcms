/**
 * Resolves the public server URL for Payload (auth cookies, CSRF, media URLs).
 *
 * Use SERVER_URL at runtime in production (not baked into the build).
 * NEXT_PUBLIC_SERVER_URL is a fallback for client-side code and local dev.
 */
export function getServerURL(): string {
  const url =
    process.env.SERVER_URL ||
    process.env.NEXT_PUBLIC_SERVER_URL ||
    'http://localhost:3000'

  return url.replace(/\/$/, '')
}

/** True when the app is served over HTTPS (secure cookies required). */
export function isSecureServerURL(): boolean {
  return getServerURL().startsWith('https://')
}

/** Hostnames allowed for Next.js Server Actions (reverse proxy / custom domain). */
export function getAllowedOrigins(): string[] {
  const origins = new Set<string>(['localhost:3000'])

  for (const key of ['SERVER_URL', 'NEXT_PUBLIC_SERVER_URL'] as const) {
    const value = process.env[key]
    if (!value) continue
    try {
      origins.add(new URL(value).host)
    } catch {
      // ignore invalid URLs
    }
  }

  return [...origins]
}
