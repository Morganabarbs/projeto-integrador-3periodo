import api from './api';
import { mockCertificados, mockTodosCertificados } from './mock';
 
const USE_MOCK = false; 
 
export async function enviarCertificado(idAluno, dados, arquivo) {
  if (USE_MOCK) {
    return { id: Date.now(), ...dados, statusValidacao: null };
  }
  const formData = new FormData();
  formData.append('dados', new Blob([JSON.stringify(dados)], { type: 'application/json' }));
  formData.append('arquivo', arquivo);
  const { data } = await api.post(`/api/certificados/enviar/${idAluno}`, formData, {
    headers: { 'Content-Type': 'multipart/form-data' },
  });
  return data;
}
 
export async function listarCertificadosDoAluno(idAluno) {
  if (USE_MOCK) return mockCertificados;
  const { data } = await api.get(`/api/certificados/aluno/${idAluno}`);
  return data;
}
 
export async function listarTodosCertificados() {
  if (USE_MOCK) return mockTodosCertificados;
  const { data } = await api.get('/api/certificados');
  return data;
}