import { Outlet } from 'react-router-dom';
import { Sidebar } from '../../components/layout/Sidebar';
import { PageLayout } from '../../components/layout/PageLayout';

const menuAluno = [
  { to: '/aluno/horas', icon: '📋', label: 'Horas Complementares' },
];

export function AlunoLayout() {
  return (
    <PageLayout
      sidebar={
        <Sidebar
          items={menuAluno}
          switchLabel="Trocar para Coordenação"
          switchTo="/coordenador/validar"
        />
      }
    >
      <Outlet />
    </PageLayout>
  );
}