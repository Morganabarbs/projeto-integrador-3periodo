import api from './api';

const USE_MOCK = false;

const mockCursos = [
  { id: 1, nome: 'Analise e Desenvolvimento de Sistemas', cargaHorariaMinima: 120 },
  { id: 2, nome: 'Design Grafico', cargaHorariaMinima: 80 },
];

const mockRegras = [
  { id: 1, area: 'Tecnologia',  limiteHoras: 60, exigeComprovante: true  },
  { id: 2, area: 'Pesquisa',    limiteHoras: 40, exigeComprovante: true  },
  { id: 3, area: 'Extensao',    limiteHoras: 20, exigeComprovante: false },
];

export async function listarCursos() {
  if (USE_MOCK) return mockCursos;
  const { data } = await api.get('/api/cursos');
  return data;
}

export async function criarCurso(curso) {
  if (USE_MOCK) return { id: Date.now(), ...curso };
  const { data } = await api.post('/api/cursos', curso);
  return data;
}

export async function editarCurso(id, curso) {
  if (USE_MOCK) return { id, ...curso };
  const { data } = await api.put(`/api/cursos/${id}`, curso);
  return data;
}

export async function excluirCurso(id) {
  if (USE_MOCK) return true;
  await api.delete(`/api/cursos/${id}`);
  return true;
}

export async function listarRegrasDoCurso(idCurso) {
  if (USE_MOCK) return mockRegras;
  const { data } = await api.get(`/api/cursos/${idCurso}/regras`);
  return data;
}

export async function criarRegra(idCurso, regra) {
  if (USE_MOCK) return { id: Date.now(), ...regra };
  const { data } = await api.post(`/api/cursos/${idCurso}/regras`, regra);
  return data;
}

export async function excluirRegra(idRegra) {
  if (USE_MOCK) return true;
  await api.delete(`/api/regras/${idRegra}`);
  return true;
}