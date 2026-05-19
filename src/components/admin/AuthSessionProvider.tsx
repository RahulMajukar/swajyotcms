'use client'

import React, { useEffect } from 'react'

const TOKEN_KEY = 'payload-auth-token'

const AUTH_PATHS = ['/api/users/login', '/api/users/refresh-token', '/api/users/me', '/api/users/logout']

function isAuthRequest(url: string): boolean {
  return AUTH_PATHS.some((path) => url.includes(path))
}

/**
 * Persists the JWT from auth API responses in localStorage and sends it via
 * Authorization on client requests. Payload still sets HTTP-only cookies for
 * SSR and Server Actions; this complements cookies when they fail in the browser.
 */
export default function AuthSessionProvider({ children }: { children: React.ReactNode }) {
  useEffect(() => {
    const originalFetch = window.fetch.bind(window)

    window.fetch = async (input: RequestInfo | URL, init?: RequestInit) => {
      const url =
        typeof input === 'string'
          ? input
          : input instanceof Request
            ? input.url
            : input.toString()

      const headers = new Headers(init?.headers)
      const storedToken = localStorage.getItem(TOKEN_KEY)

      if (storedToken && !headers.has('Authorization')) {
        headers.set('Authorization', `JWT ${storedToken}`)
      }

      const response = await originalFetch(input, {
        ...init,
        headers,
        credentials: init?.credentials ?? 'include',
      })

      if (isAuthRequest(url)) {
        try {
          const data = await response.clone().json()
          if (typeof data?.token === 'string' && data.token.length > 0) {
            localStorage.setItem(TOKEN_KEY, data.token)
          } else if (url.includes('/logout') || (url.includes('/me') && !data?.user)) {
            localStorage.removeItem(TOKEN_KEY)
          }
        } catch {
          // non-JSON or empty body
        }
      }

      return response
    }

    return () => {
      window.fetch = originalFetch
    }
  }, [])

  return <>{children}</>
}
