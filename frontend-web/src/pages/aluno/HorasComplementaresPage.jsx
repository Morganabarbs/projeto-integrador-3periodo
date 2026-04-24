import { useState, useContext } from 'react';
import { Header } from '../../components/layout/Header';
import { AuthContext } from '../../contexts/AuthContext';
import { useCertificados } from '../../hooks/useCertificados';

const statusConfig = {
  APROVADO:  { label: 'Aprovado',  bg: '#E1F5EE', color: '#085041' },
  REPROVADO: { label: 'Reprovado', bg: '#FEECEC', color: '#7F1D1D' },
  PENDENTE:  { label: 'Pendente',  bg: '#FEF3C7', color: '#92400E' },
};

function getStatus(statusValidacao) {
  if (!statusValidacao) return statusConfig.PENDENTE;
  return statusConfig[statusValidacao] ?? statusConfig.PENDENTE;
}

export function HorasComplementaresPage() {
  const { user } = useContext(AuthContext);
  const { certificados, loading, enviar, error } = useCertificados(user?.id);

  const [arquivo, setArquivo] = useState(null);
  const [form, setForm] = useState({
    tituloAtividade: '',
    cargaHorariaInformada: '',
    dataAtividade: '',
    idArea: '',
  });

  async function handleSubmit(e) {
    e.preventDefault();
    if (!arquivo) return alert('Selecione um arquivo');
    
    try {
      await enviar(form, arquivo);
      alert('Certificado enviado com sucesso!');
      setForm({
        tituloAtividade: '',
        cargaHorariaInformada: '',
        dataAtividade: '',
        idArea: '',
      });
      setArquivo(null);
    } catch (err) {
      alert('Erro ao enviar certificado: ' + (err.response?.data?.message || err.message));
    }
  }

  function handleArquivo(e) {
    setArquivo(e.target.files[0]);
  }

  function handleForm(e) {
    setForm({ ...form, [e.target.name]: e.target.value });
  }

  return (
    <div>
      <Header
        titulo="Horas Complementares"
        subtitulo="Envie seus certificados e acompanhe a validacao."
      />

      <div style={{ padding: '32px 40px' }}>

        <div style={{
          background: '#fff',
          border: '1px solid #e5e7eb',
          borderRadius: 12,
          padding: 24,
          marginBottom: 24,
        }}>
          <h2 style={{ fontSize: 16, fontWeight: 600, marginBottom: 16 }}>
            Enviar Certificado
          </h2>

          <form onSubmit={handleSubmit}>
            <div style={{
              display: 'grid',
              gridTemplateColumns: '1fr 1fr',
              gap: 16,
              marginBottom: 16,
            }}>
              <div>
                <label style={{ fontSize: 13, fontWeight: 500, display: 'block', marginBottom: 6 }}>
                  Titulo da Atividade
                </label>
                <input
                  required
                  name="tituloAtividade"
                  value={form.tituloAtividade}
                  onChange={handleForm}
                  placeholder="Ex: Curso de React"
                  style={{
                    width: '100%',
                    padding: '9px 12px',
                    boxSizing: 'border-box',
                    border: '1px solid #e5e7eb',
                    borderRadius: 8,
                    fontSize: 14,
                  }}
                />
              </div>

              <div>
                <label style={{ fontSize: 13, fontWeight: 500, display: 'block', marginBottom: 6 }}>
                  Carga Horaria (horas)
                </label>
                <input
                  required
                  type="number"
                  name="cargaHorariaInformada"
                  value={form.cargaHorariaInformada}
                  onChange={handleForm}
                  placeholder="Ex: 20"
                  style={{
                    width: '100%',
                    padding: '9px 12px',
                    boxSizing: 'border-box',
                    border: '1px solid #e5e7eb',
                    borderRadius: 8,
                    fontSize: 14,
                  }}
                />
              </div>

              <div>
                <label style={{ fontSize: 13, fontWeight: 500, display: 'block', marginBottom: 6 }}>
                  Data da Atividade
                </label>
                <input
                  required
                  type="date"
                  name="dataAtividade"
                  value={form.dataAtividade}
                  onChange={handleForm}
                  style={{
                    width: '100%',
                    padding: '9px 12px',
                    boxSizing: 'border-box',
                    border: '1px solid #e5e7eb',
                    borderRadius: 8,
                    fontSize: 14,
                  }}
                />
              </div>

              <div>
                <label style={{ fontSize: 13, fontWeight: 500, display: 'block', marginBottom: 6 }}>
                  Area
                </label>
                <select
                  required
                  name="idArea"
                  value={form.idArea}
                  onChange={handleForm}
                  style={{
                    width: '100%',
                    padding: '9px 12px',
                    boxSizing: 'border-box',
                    border: '1px solid #e5e7eb',
                    borderRadius: 8,
                    fontSize: 14,
                    background: '#fff',
                  }}
                >
                  <option value="">Selecione uma area</option>
                  <option value="1">Tecnologia</option>
                  <option value="2">Pesquisa</option>
                  <option value="3">Extensao</option>
                  <option value="4">Esportes</option>
                  <option value="5">Arte e Cultura</option>
                </select>
              </div>
            </div>

            <div style={{ marginBottom: 16 }}>
              <label style={{ fontSize: 13, fontWeight: 500, display: 'block', marginBottom: 6 }}>
                Arquivo (PDF ou imagem)
              </label>
              <div style={{
                border: '2px dashed #e5e7eb',
                borderRadius: 8,
                padding: 20,
                textAlign: 'center',
                background: '#fafafa',
              }}>
                <input
                  type="file"
                  accept=".pdf,.jpg,.jpeg,.png"
                  onChange={handleArquivo}
                  style={{ display: 'none' }}
                  id="arquivo-input"
                />
                <label htmlFor="arquivo-input" style={{ cursor: 'pointer' }}>
                  <div style={{ fontSize: 24, marginBottom: 8 }}>📎</div>
                  <p style={{ fontSize: 13, color: '#6b7280', margin: 0 }}>
                    {arquivo ? arquivo.name : 'Clique para escolher o arquivo'}
                  </p>
                  <p style={{ fontSize: 11, color: '#9ca3af', margin: '4px 0 0' }}>
                    PDF, JPG ou PNG
                  </p>
                </label>
              </div>
            </div>

            <button
              type="submit"
              disabled={loading}
              style={{
                padding: '10px 24px',
                background: '#003D7A',
                color: '#fff',
                border: 'none',
                borderRadius: 8,
                fontSize: 14,
                fontWeight: 500,
                cursor: loading ? 'not-allowed' : 'pointer',
                opacity: loading ? 0.7 : 1,
              }}
            >
              {loading ? 'Enviando...' : 'Enviar Certificado'}
            </button>
          </form>
        </div>

        <div style={{
          background: '#fff',
          border: '1px solid #e5e7eb',
          borderRadius: 12,
          padding: 24,
        }}>
          <h2 style={{ fontSize: 16, fontWeight: 600, marginBottom: 16 }}>
            Certificados Enviados
          </h2>

          {loading && certificados.length === 0 ? (
            <p style={{ textAlign: 'center', color: '#6b7280' }}>Carregando certificados...</p>
          ) : (
            <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 14 }}>
              <thead>
                <tr style={{ borderBottom: '1px solid #e5e7eb' }}>
                  <th style={{ padding: '8px 12px', textAlign: 'left', color: '#6b7280', fontWeight: 500 }}>Titulo</th>
                  <th style={{ padding: '8px 12px', textAlign: 'left', color: '#6b7280', fontWeight: 500 }}>Area</th>
                  <th style={{ padding: '8px 12px', textAlign: 'left', color: '#6b7280', fontWeight: 500 }}>Data de Envio</th>
                  <th style={{ padding: '8px 12px', textAlign: 'left', color: '#6b7280', fontWeight: 500 }}>Horas</th>
                  <th style={{ padding: '8px 12px', textAlign: 'left', color: '#6b7280', fontWeight: 500 }}>Status</th>
                </tr>
              </thead>
              <tbody>
                {certificados.length === 0 ? (
                  <tr>
                    <td colSpan="5" style={{ padding: 24, textAlign: 'center', color: '#9ca3af' }}>
                      Nenhum certificado encontrado.
                    </td>
                  </tr>
                ) : (
                  certificados.map(function(cert) {
                    var status = getStatus(cert.statusValidacao);
                    return (
                      <tr key={cert.id} style={{ borderBottom: '1px solid #f3f4f6' }}>
                        <td style={{ padding: 12 }}>{cert.tituloAtividade}</td>
                        <td style={{ padding: 12, color: '#6b7280' }}>{cert.nomeArea}</td>
                        <td style={{ padding: 12, color: '#6b7280' }}>{cert.dataEnvio}</td>
                        <td style={{ padding: 12 }}>{cert.cargaHorariaInformada}h</td>
                        <td style={{ padding: 12 }}>
                          <span style={{
                            display: 'inline-block',
                            padding: '3px 10px',
                            borderRadius: 20,
                            fontSize: 12,
                            fontWeight: 500,
                            background: status.bg,
                            color: status.color,
                          }}>
                            {status.label}
                          </span>
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          )}
        </div>

      </div>
    </div>
  );
}