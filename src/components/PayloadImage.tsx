import type { Media } from '@/payload-types'

type Props = {
  image: Media | string | null | undefined
  alt?: string
  className?: string
  style?: React.CSSProperties
  width?: number
  height?: number
}

export default function PayloadImage({ image, alt, className, style, width, height }: Props) {
  if (!image || typeof image === 'string') return null

  const src = image.url
  if (!src) return null

  return (
    // eslint-disable-next-line @next/next/no-img-element
    <img
      src={src}
      alt={alt ?? (image.alt || '')}
      className={className}
      style={style}
      width={width ?? (image.width ?? undefined)}
      height={height ?? (image.height ?? undefined)}
      loading="lazy"
    />
  )
}
