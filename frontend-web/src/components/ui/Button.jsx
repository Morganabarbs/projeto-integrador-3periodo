// src/components/ui/Button.jsx

export function Button({ children, variant = 'primary', size = 'md', loading, ...props }) {
  const styles = {
    primary: {
      background: 'var(--color-primary)',
      color: '#fff',
      border: 'none',
    },
    success: {
      background: 'var(--color-success)',
      color: '#fff',
      border: 'none',
    },
    danger: {
      background: 'var(--color-danger)',
      color: '#fff',
      border: 'none',
    },
    outline: {
      background: 'transparent',
      color: 'var(--color-primary)',
      border: '1px solid var(--color-primary)',
    },
    ghost: {
      background: 'transparent',
      color: 'var(--color-text-muted)',
      border: '1px solid var(--color-border)',
    },
  };

  const sizes = {
    sm: { padding: '4px 12px', fontSize: 'var(--font-size-sm)' },
    md: { padding: '8px 16px', fontSize: 'var(--font-size-md)' },
    lg: { padding: '12px 24px', fontSize: 'var(--font-size-base)' },
  };

  return (
    <button
      disabled={loading || props.disabled}
      style={{
        ...styles[variant],
        ...sizes[size],
        borderRadius: 'var(--radius-md)',
        cursor: loading ? 'not-allowed' : 'pointer',
        opacity: loading ? 0.7 : 1,
        display: 'inline-flex',
        alignItems: 'center',
        gap: '6px',
        fontWeight: 500,
        transition: 'opacity .15s',
      }}
      {...props}
    >
      {loading ? '...' : children}
    </button>
  );
}