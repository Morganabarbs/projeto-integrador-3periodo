import { Outlet } from 'react-router-dom';
import { Sidebar } from '../../components/layout/Sidebar';
import { PageLayout } from '../../components/layout/PageLayout';

const menuAdmin = [
  { to: '/admin/cursos',   icon: '📚', label: 'Gerenciar Cursos' },
  { to: '/admin/regras',   icon: '📋', label: 'Regras de Atividade' },
  { to: '/admin/usuarios', icon: '👥', label: 'Usuarios' },
];

export function AdminLayout() {
  return (
    <PageLayout
      sidebar={
        <Sidebar
          items={menuAdmin}
          switchLabel={null}
          switchTo={null}
        />
      }
    >
      <Outlet />
    </PageLayout>
  );
}