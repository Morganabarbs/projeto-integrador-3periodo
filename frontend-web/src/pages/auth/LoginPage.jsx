import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../hooks/useAuth';
import logoSenac from '../../assets/logo-senac.svg.png';
import toast from 'react-hot-toast';

const schema = z.object({
  email: z.string().email('E-mail inválido'),
  senha: z.string().min(6, 'Mínimo 6 caracteres'),
});

const perfisRedirect = {
  ALUNO:       '/aluno/horas',
  COORDENADOR: '/coordenador/validar',
  ADMIN:       '/admin/cursos',
};

export function LoginPage() {
  const { login } = useAuth();
  const navigate  = useNavigate();
  const { register, handleSubmit, formState: { errors, isSubmitting } } = useForm({
    resolver: zodResolver(schema),
  });

  const onSubmit = async (data) => {
    try {
      const perfil = await login(data.email, data.senha);
      navigate(perfisRedirect[perfil] ?? '/');
    } catch (err) {
      toast.error(err?.response?.data?.message ?? 'Credenciais inválidas');
    }
  };

  return (
    <div style={{
      minHeight: '100vh', display: 'flex',
      alignItems: 'center', justifyContent: 'center',
      background: 'var(--color-bg-page)',
    }}>
      <div style={{
        width: 360, background: 'var(--color-bg-card)',
        borderRadius: 'var(--radius-lg)',
        padding: '40px 32px',
        border: '1px solid var(--color-border)',
        boxShadow: 'var(--shadow-md)',
      }}>
        <div style={{ textAlign: 'center', marginBottom: 32 }}>
          <img src={logoSenac} alt="SENAC" style={{ height: 48, marginBottom: 8 }} />
          <h1 style={{ fontSize: 20, fontWeight: 600, color: 'var(--color-text)' }}>AcadPortal</h1>
          <p style={{ fontSize: 13, color: 'var(--color-text-muted)', marginTop: 4 }}>
            Sistema de Horas Complementares
          </p>
        </div>

        <form onSubmit={handleSubmit(onSubmit)} style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
          <div>
            <label style={{ fontSize: 13, fontWeight: 500, color: 'var(--color-text)', display: 'block', marginBottom: 6 }}>
              E-mail
            </label>
            <input
              {...register('email')}
              type="email"
              placeholder="seu@email.com"
              style={{
                width: '100%', padding: '10px 12px',
                border: `1px solid ${errors.email ? 'var(--color-danger)' : 'var(--color-border)'}`,
                borderRadius: 'var(--radius-md)',
                fontSize: 14, outline: 'none', boxSizing: 'border-box',
              }}
            />
            {errors.email && <span style={{ fontSize: 11, color: 'var(--color-danger)', marginTop: 4, display: 'block' }}>{errors.email.message}</span>}
          </div>

          <div>
            <label style={{ fontSize: 13, fontWeight: 500, color: 'var(--color-text)', display: 'block', marginBottom: 6 }}>
              Senha
            </label>
            <input
              {...register('senha')}
              type="password"
              placeholder="••••••••"
              style={{
                width: '100%', padding: '10px 12px',
                border: `1px solid ${errors.senha ? 'var(--color-danger)' : 'var(--color-border)'}`,
                borderRadius: 'var(--radius-md)',
                fontSize: 14, outline: 'none', boxSizing: 'border-box',
              }}
            />
            {errors.senha && <span style={{ fontSize: 11, color: 'var(--color-danger)', marginTop: 4, display: 'block' }}>{errors.senha.message}</span>}
          </div>

          <button
            type="submit"
            disabled={isSubmitting}
            style={{
              padding: '11px', background: 'var(--color-primary)',
              color: '#fff', border: 'none', borderRadius: 'var(--radius-md)',
              fontSize: 15, fontWeight: 500, cursor: isSubmitting ? 'not-allowed' : 'pointer',
              opacity: isSubmitting ? 0.7 : 1, marginTop: 8,
            }}
          >
            {isSubmitting ? 'Entrando...' : 'Entrar'}
          </button>
        </form>
      </div>
    </div>
  );
}