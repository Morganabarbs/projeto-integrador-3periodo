import api from './api';
 
const USE_MOCK = false;
 
export async function validarCertificado(idCertificado, { status, observacao, horasValidadas }) {
  if (USE_MOCK) {
    return { id: idCertificado, status, observacao, horasValidadas };
  }
  const { data } = await api.post(`/api/validacoes/certificado/${idCertificado}`, {
    status,
    observacao,
    horasValidadas,
  });
  return data;
}
 
export const aprovarCertificado = (id, horasValidadas, observacao = '') =>
  validarCertificado(id, { status: 'APROVADO', horasValidadas, observacao });
 
export const rejeitarCertificado = (id, observacao) =>
  validarCertificado(id, { status: 'REJEITADO', observacao, horasValidadas: 0 });