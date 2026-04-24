import { createContext, useState, useEffect } from 'react';
import { login as loginService, logout as logoutService, getUsuarioLogado } from '../services/auth.service';

export const AuthContext = createContext(null);

export const PERFIL_REDIRECT = {
  ALUNO:       '/aluno/horas',
  COORDENADOR: '/coordenador/validar',
  ADMIN:       '/admin/cursos',
};

export function AuthProvider({ children }) {
  const [user, setUser]       = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const token   = localStorage.getItem('token');
    const usuario = getUsuarioLogado();
    if (token && usuario) setUser(usuario);
    setLoading(false);
  }, []);

  const login = async (email, senha) => {
    const data = await loginService(email, senha);
    setUser({ id: data.id, nome: data.nome, perfil: data.perfil });
    return data.perfil;
  };

  const logout = () => {
    logoutService();
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, login, logout, loading }}>
      {children}
    </AuthContext.Provider>
  );
}