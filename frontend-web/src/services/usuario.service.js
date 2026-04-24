import api from './api';
 
const USE_MOCK = false;
 
export async function listarUsuarios() {
  if (USE_MOCK) return [];
  const { data } = await api.get('/usuarios');
  return data;
}
 
export async function criarAluno(aluno) {
  if (USE_MOCK) return { id: Date.now(), ...aluno };
  const { data } = await api.post('/usuarios/alunos', aluno);
  return data;
}
 
export async function criarCoordenador(coordenador) {
  if (USE_MOCK) return { id: Date.now(), ...coordenador };
  const { data } = await api.post('/usuarios/coordenadores', coordenador);
  return data;
}