const MOCK_USUARIOS = [
  { email: 'aluno@senac.br',       senha: '123456', perfil: 'ALUNO',       nome: 'Joao Cesar da Silva' },
  { email: 'coordenador@senac.br', senha: '123456', perfil: 'COORDENADOR', nome: 'Ana Coordenadora'    },
  { email: 'admin@senac.br',       senha: '123456', perfil: 'ADMIN',       nome: 'Super Admin'         },
];
 
import api from './api';

export async function login(email, senha) {
  const { data } = await api.post('/api/auth/login', { email, senha });
  localStorage.setItem('token', data.token);
  localStorage.setItem('usuario', JSON.stringify({ 
    id: data.id, 
    nome: data.nome, 
    perfil: data.perfil 
  }));
  return data;
}

export function logout() {
  localStorage.removeItem('token');
  localStorage.removeItem('usuario');
}

export function getUsuarioLogado() {
  const raw = localStorage.getItem('usuario');
  return raw ? JSON.parse(raw) : null;
}
