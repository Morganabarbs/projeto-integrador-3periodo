// src/components/ui/Badge.jsx

const variants = {
  aprovado:  { bg: '#E1F5EE', color: '#085041', label: 'Aprovado' },
  pendente:  { bg: '#FEF3C7', color: '#92400E', label: 'Pendente' },
  rejeitado: { bg: '#FEECEC', color: '#7F1D1D', label: 'Rejeitado' },
};

export function Badge({ status }) {
  const v = variants[status?.toLowerCase()] ?? variants.pendente;
  return (
    <span style={{
      display: 'inline-block',
      padding: '2px 10px',
      borderRadius: 'var(--radius-full)',
      fontSize: 'var(--font-size-sm)',
      fontWeight: 500,
      background: v.bg,
      color: v.color,
    }}>
      {v.label}
    </span>
  );
}