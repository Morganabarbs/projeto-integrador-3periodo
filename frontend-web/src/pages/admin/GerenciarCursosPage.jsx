import { useState } from 'react';
import { Header } from '../../components/layout/Header';
import { mockCursos } from '../../services/mock';

export function GerenciarCursosPage() {
  const [cursos, setCursos] = useState(mockCursos);
  const [modal, setModal]   = useState(false);
  const [editando, setEditando] = useState(null);
  const [form, setForm] = useState({ nome: '', cargaTotalExigida: '' });

  function abrirCriar() {
    setEditando(null);
    setForm({ nome: '', cargaTotalExigida: '' });
    setModal(true);
  }

  function abrirEditar(curso) {
    setEditando(curso);
    setForm({ nome: curso.nome, cargaTotalExigida: curso.cargaTotalExigida });
    setModal(true);
  }

  function fechar() { setModal(false); }

  function salvar() {
    if (editando) {
      setCursos(prev => prev.map(c => c.id === editando.id ? { ...c, ...form } : c));
    } else {
      setCursos(prev => [...prev, { id: Date.now(), ...form }]);
    }
    fechar();
  }

  function excluir(id) {
    if (confirm('Deseja excluir este curso?')) {
      setCursos(prev => prev.filter(c => c.id !== id));
    }
  }

  return (
    <div>
      <Header titulo="Gerenciar Cursos" subtitulo="Cadastre e gerencie os cursos da instituicao." />

      <div style={{ padding: '32px 40px' }}>
        <div style={{ background: '#fff', border: '1px solid #e5e7eb', borderRadius: 12, padding: 24 }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 20 }}>
            <h2 style={{ fontSize: 16, fontWeight: 600 }}>Cursos cadastrados</h2>
            <button onClick={abrirCriar} style={{ padding: '8px 18px', background: '#003D7A', color: '#fff', border: 'none', borderRadius: 8, fontSize: 14, cursor: 'pointer' }}>
              + Novo Curso
            </button>
          </div>

          <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 14 }}>
            <thead>
              <tr style={{ borderBottom: '1px solid #e5e7eb' }}>
                <th style={{ padding: '8px 12px', textAlign: 'left', color: '#6b7280', fontWeight: 500 }}>Nome do Curso</th>
                <th style={{ padding: '8px 12px', textAlign: 'left', color: '#6b7280', fontWeight: 500 }}>Carga Horaria Minima</th>
                <th style={{ padding: '8px 12px', textAlign: 'left', color: '#6b7280', fontWeight: 500 }}>Acoes</th>
              </tr>
            </thead>
            <tbody>
              {cursos.map(curso => (
                <tr key={curso.id} style={{ borderBottom: '1px solid #f3f4f6' }}>
                  <td style={{ padding: 12 }}>{curso.nome}</td>
                  <td style={{ padding: 12 }}>{curso.cargaTotalExigida}h</td>
                  <td style={{ padding: 12, display: 'flex', gap: 8 }}>
                    <button onClick={() => abrirEditar(curso)} style={{ padding: '5px 12px', background: '#f3f4f6', border: 'none', borderRadius: 6, fontSize: 13, cursor: 'pointer' }}>
                      ✏ Editar
                    </button>
                    <button onClick={() => excluir(curso.id)} style={{ padding: '5px 12px', background: '#FEECEC', color: '#7F1D1D', border: 'none', borderRadius: 6, fontSize: 13, cursor: 'pointer' }}>
                      🗑 Excluir
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {modal && (
        <div style={{ position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.4)', display: 'flex', alignItems: 'center', justifyContent: 'center', zIndex: 200 }}>
          <div style={{ background: '#fff', borderRadius: 12, padding: 32, width: 400 }}>
            <h3 style={{ fontSize: 16, fontWeight: 600, marginBottom: 20 }}>
              {editando ? 'Editar Curso' : 'Novo Curso'}
            </h3>
            <div style={{ marginBottom: 14 }}>
              <label style={{ fontSize: 13, fontWeight: 500, display: 'block', marginBottom: 6 }}>Nome do Curso</label>
              <input value={form.nome} onChange={e => setForm({ ...form, nome: e.target.value })}
                style={{ width: '100%', padding: '9px 12px', boxSizing: 'border-box', border: '1px solid #e5e7eb', borderRadius: 8, fontSize: 14 }} />
            </div>
            <div style={{ marginBottom: 20 }}>
              <label style={{ fontSize: 13, fontWeight: 500, display: 'block', marginBottom: 6 }}>Carga Horaria Minima (h)</label>
              <input type="number" value={form.cargaTotalExigida} onChange={e => setForm({ ...form, cargaTotalExigida: e.target.value })}
                style={{ width: '100%', padding: '9px 12px', boxSizing: 'border-box', border: '1px solid #e5e7eb', borderRadius: 8, fontSize: 14 }} />
            </div>
            <div style={{ display: 'flex', gap: 10, justifyContent: 'flex-end' }}>
              <button onClick={fechar} style={{ padding: '9px 20px', background: '#f3f4f6', border: 'none', borderRadius: 8, fontSize: 14, cursor: 'pointer' }}>Cancelar</button>
              <button onClick={salvar} style={{ padding: '9px 20px', background: '#003D7A', color: '#fff', border: 'none', borderRadius: 8, fontSize: 14, cursor: 'pointer' }}>Salvar</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}