import React from 'react'

type LexicalNode = {
  type: string
  text?: string
  format?: number
  tag?: string
  listType?: string
  direction?: string | null
  children?: LexicalNode[]
  fields?: { url?: string; newTab?: boolean }
  [key: string]: unknown
}

// Lexical format bitmask
function applyFormat(text: string, format: number): React.ReactNode {
  let el: React.ReactNode = text
  if (format & 16) el = <code>{el}</code>           // code
  if (format & 1)  el = <strong>{el}</strong>        // bold
  if (format & 2)  el = <em>{el}</em>                // italic
  if (format & 8)  el = <u>{el}</u>                  // underline
  if (format & 4)  el = <s>{el}</s>                  // strikethrough
  return el
}

function renderChildren(children: LexicalNode[] = []): React.ReactNode {
  return children.map((node, i) => renderNode(node, i))
}

function renderNode(node: LexicalNode, key: number): React.ReactNode {
  switch (node.type) {
    case 'text': {
      const formatted = applyFormat(node.text ?? '', node.format ?? 0)
      // Only wrap if formatting was applied (avoid extra spans for plain text)
      return node.format ? <React.Fragment key={key}>{formatted}</React.Fragment> : node.text
    }

    case 'linebreak':
      return <br key={key} />

    case 'paragraph':
      return (
        <p key={key}>
          {renderChildren(node.children)}
        </p>
      )

    case 'heading': {
      const Tag = (node.tag ?? 'h2') as 'h1' | 'h2' | 'h3' | 'h4' | 'h5' | 'h6'
      return <Tag key={key}>{renderChildren(node.children)}</Tag>
    }

    case 'list': {
      const Tag = node.listType === 'bullet' ? 'ul' : 'ol'
      return <Tag key={key}>{renderChildren(node.children)}</Tag>
    }

    case 'listitem':
      return <li key={key}>{renderChildren(node.children)}</li>

    case 'quote':
      return <blockquote key={key}>{renderChildren(node.children)}</blockquote>

    case 'link': {
      const url      = (node.fields?.url as string) ?? '#'
      const newTab   = node.fields?.newTab as boolean
      return (
        <a key={key} href={url} target={newTab ? '_blank' : undefined} rel="noopener noreferrer">
          {renderChildren(node.children)}
        </a>
      )
    }

    case 'upload':
    case 'block':
      // Extend here for custom blocks / embedded media
      return null

    default:
      // Unknown node — try to render children if present
      return node.children ? (
        <React.Fragment key={key}>{renderChildren(node.children)}</React.Fragment>
      ) : null
  }
}

type Props = {
  content: { root?: { children?: LexicalNode[] } } | null | undefined
  className?: string
}

export default function RichText({ content, className }: Props) {
  const children = content?.root?.children
  if (!children?.length) return null

  return (
    <div className={`rich-text ${className ?? ''}`.trim()}>
      {children.map((node, i) => renderNode(node, i))}
    </div>
  )
}
