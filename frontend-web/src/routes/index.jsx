import { createBrowserRouter, Navigate } from 'react-router-dom';
import { PrivateRoute } from './PrivateRoute';
import { RoleRoute }    from './RoleRoute';
import { LoginPage }    from '../pages/auth/LoginPage';

import { AlunoLayout }             from '../pages/aluno/AlunoLayout';
import { HorasComplementaresPage } from '../pages/aluno/HorasComplementaresPage';

import { CoordernadorLayout }      from '../pages/coordenador/CoordernadorLayout';
import { ValidarCertificadosPage } from '../pages/coordenador/ValidarCertificadosPage';

import { AdminLayout }             from '../pages/admin/AdminLayout';
import { GerenciarCursosPage }     from '../pages/admin/GerenciarCursosPage';
import { GerenciarRegrasPage }     from '../pages/admin/GerenciarRegrasPage';

export const router = createBrowserRouter([
  { path: '/login',          element: <LoginPage /> },
  { path: '/nao-autorizado', element: <div style={{ padding: 40 }}>Sem permissao de acesso.</div> },

  // ALUNO
  {
    element: <PrivateRoute />,
    children: [{
      element: <RoleRoute roles={['ALUNO']} />,
      children: [{
        element: <AlunoLayout />,
        children: [
          { path: '/aluno/horas', element: <HorasComplementaresPage /> },
        ],
      }],
    }],
  },

  // COORDENADOR
  {
    element: <PrivateRoute />,
    children: [{
      element: <RoleRoute roles={['COORDENADOR']} />,
      children: [{
        element: <CoordernadorLayout />,
        children: [
          { path: '/coordenador/validar', element: <ValidarCertificadosPage /> },
        ],
      }],
    }],
  },

  // ADMIN
  {
    element: <PrivateRoute />,
    children: [{
      element: <RoleRoute roles={['ADMIN']} />,
      children: [{
        element: <AdminLayout />,
        children: [
          { path: '/admin/cursos',   element: <GerenciarCursosPage /> },
          { path: '/admin/regras',   element: <GerenciarRegrasPage /> },
        ],
      }],
    }],
  },

  { path: '/', element: <Navigate to="/login" replace /> },
]);