-- =============================================================
-- SISTEMA DE ATIVIDADES COMPLEMENTARES - sistema_acc
-- Script de POPULAÇÃO DO BANCO (SEED)
-- Execute após: sistema_acc.sql e sistema_acc_update.sql
-- Obs: triggers disparam automaticamente durante os INSERTs
-- =============================================================

USE sistema_acc;

-- =============================================================
-- --- USUARIO ---
-- Senhas em bcrypt (hash de '123456' para fins de teste)
-- =============================================================

INSERT INTO Usuario (senha, nome, perfil, email) VALUES
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Carlos Alberto Mendes',    'ADMIN',       'carlos.admin@faculdade.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Fernanda Lima Souza',      'COORDENADOR', 'fernanda.lima@faculdade.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Roberto Alves Pereira',    'COORDENADOR', 'roberto.alves@faculdade.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Patrícia Santos Cruz',     'COORDENADOR', 'patricia.santos@faculdade.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Marcos Vinícius Andrade',  'COORDENADOR', 'marcos.andrade@faculdade.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Ana Clara Rodrigues',      'ALUNO',       'ana.rodrigues@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Bruno Henrique Costa',     'ALUNO',       'bruno.costa@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Camila Ferreira Nunes',    'ALUNO',       'camila.nunes@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Diego Martins Barbosa',    'ALUNO',       'diego.barbosa@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Eduarda Gomes Teixeira',   'ALUNO',       'eduarda.teixeira@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Felipe Nascimento Lima',   'ALUNO',       'felipe.lima@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Gabriela Oliveira Melo',   'ALUNO',       'gabriela.melo@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Henrique Torres Silva',    'ALUNO',       'henrique.silva@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Isabela Ramos Carvalho',   'ALUNO',       'isabela.carvalho@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'João Pedro Almeida',       'ALUNO',       'joao.almeida@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Karen Souza Pinto',        'ALUNO',       'karen.pinto@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Lucas Freitas Araújo',     'ALUNO',       'lucas.araujo@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Marina Dias Correia',      'ALUNO',       'marina.correia@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Nathan Cardoso Moreira',   'ALUNO',       'nathan.moreira@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Olivia Ribeiro Campos',    'ALUNO',       'olivia.campos@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Pedro Henrique Faria',     'ALUNO',       'pedro.faria@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Quésia Monteiro Leal',     'ALUNO',       'quesia.leal@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Rafael Cunha Mendonça',    'ALUNO',       'rafael.mendonca@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Sabrina Luz Batista',      'ALUNO',       'sabrina.batista@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Thiago Vasconcelos Brito', 'ALUNO',       'thiago.brito@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Ursula Fonseca Aguiar',    'ALUNO',       'ursula.aguiar@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Victor Hugo Pacheco',      'ALUNO',       'victor.pacheco@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Wanessa Duarte Rezende',   'ALUNO',       'wanessa.rezende@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Xande Borges Macedo',      'ALUNO',       'xande.macedo@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Yasmin Cavalcante Maia',   'ALUNO',       'yasmin.maia@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Zaqueu Pires Tavares',     'ALUNO',       'zaqueu.tavares@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Amanda Leite Rocha',       'ALUNO',       'amanda.rocha@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Bernardo Assis Moura',     'ALUNO',       'bernardo.moura@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Cecília Neves Drummond',   'ALUNO',       'cecilia.drummond@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Danilo Queiroz Esteves',   'ALUNO',       'danilo.esteves@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Elisa Braga Magalhães',    'ALUNO',       'elisa.magalhaes@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Fábio Sena Vilela',        'ALUNO',       'fabio.vilela@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Giovana Prado Barros',     'ALUNO',       'giovana.barros@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Hugo Lacerda Guimarães',   'ALUNO',       'hugo.guimaraes@aluno.edu.br'),
('$2b$10$KIXQz1234567890abcdefABCDEFGHIJKLMNOPQRSTUVWXYZ12', 'Ingrid Sampaio Nogueira',  'ALUNO',       'ingrid.nogueira@aluno.edu.br');
-- trigger trg_log_novo_usuario dispara automaticamente para cada insert acima

-- =============================================================
-- --- COORDENADOR ---
-- id_usuario: 2=Fernanda, 3=Roberto, 4=Patrícia, 5=Marcos
-- =============================================================

INSERT INTO Coordenador (id_usuario, departamento) VALUES
(2, 'Departamento de Tecnologia da Informação'),
(3, 'Departamento de Engenharia de Software'),
(4, 'Departamento de Sistemas de Informação'),
(5, 'Departamento de Ciência da Computação');

-- =============================================================
-- --- ALUNO ---
-- id_usuario: 6 ao 41 (todos os ALUNOs inseridos acima)
-- =============================================================

INSERT INTO Aluno (id_usuario, matricula, periodo) VALUES (6,  '2022001001', 5);

select * from Aluno;


INSERT INTO Aluno (id_usuario, matricula, periodo) VALUES
(6,  '2022001001', 5),
(7,  '2022001002', 4),
(8,  '2022001003', 6),
(9,  '2021001004', 7),
(10, '2021001005', 8),
(11, '2023001006', 3),
(12, '2023001007', 2),
(13, '2022001008', 5),
(14, '2021001009', 7),
(15, '2022001010', 4),
(16, '2023001011', 3),
(17, '2021001012', 6),
(18, '2022001013', 5),
(19, '2023001014', 2),
(20, '2021001015', 8),
(21, '2022001016', 4),
(22, '2023001017', 3),
(23, '2021001018', 7),
(24, '2022001019', 6),
(25, '2021001020', 8),
(26, '2022001021', 5),
(27, '2023001022', 2),
(28, '2021001023', 7),
(29, '2022001024', 4),
(30, '2023001025', 3),
(31, '2022001026', 6),
(32, '2021001027', 8),
(33, '2023001028', 2),
(34, '2022001029', 5),
(35, '2021001030', 7),
(36, '2023001031', 3),
(37, '2022001032', 4),
(38, '2021001033', 6),
(39, '2023001034', 2),
(40, '2022001035', 5);

-- =============================================================
-- --- CURSO ---
-- =============================================================

INSERT INTO Curso (nome_curso, carga_total_exigida) VALUES
('Análise e Desenvolvimento de Sistemas',  200.00),
('Engenharia de Software',                 240.00),
('Sistemas de Informação',                 200.00),
('Ciência da Computação',                  240.00),
('Redes de Computadores',                  160.00),
('Banco de Dados',                         160.00),
('Desenvolvimento Web',                    180.00),
('Inteligência Artificial',                200.00),
('Segurança da Informação',                180.00),
('Gestão de TI',                           160.00);

-- =============================================================
-- --- AREA_ATIVIDADE ---
-- =============================================================

INSERT INTO Area_Atividade (nome_area, limite_horas_area) VALUES
('Ensino',                          80.00),
('Pesquisa e Inovação',             80.00),
('Extensão e Cultura',              60.00),
('Gestão e Representação Estudantil', 40.00),
('Empreendedorismo',                60.00),
('Publicações e Produções',         40.00),
('Cursos e Capacitações',           80.00),
('Eventos Técnicos e Científicos',  60.00),
('Voluntariado',                    40.00),
('Estágio Não Obrigatório',         80.00);

-- =============================================================
-- --- REGRA ---
-- id_coordenador (id_usuario): 2,3,4,5
-- =============================================================

INSERT INTO Regra (descricao, limite_horas, tipo_atividade, id_usuario_coordenador, id_area) VALUES
('Monitoria em disciplinas do curso reconhecida pela instituição',                          40.00, 'Monitoria',              2, 1),
('Iniciação científica com orientação de docente',                                          60.00, 'Iniciação Científica',   2, 2),
('Participação em projetos de extensão aprovados pela coordenação',                         40.00, 'Extensão',               3, 3),
('Participação em órgãos colegiados como representante discente',                           20.00, 'Representação',          3, 4),
('Participação em empresa júnior vinculada à instituição',                                  40.00, 'Empresa Júnior',         4, 5),
('Artigos publicados em periódicos ou anais de eventos',                                    30.00, 'Publicação',             4, 6),
('Cursos de extensão, idiomas ou certificações reconhecidas pelo mercado',                  60.00, 'Curso Externo',          5, 7),
('Participação em congressos, seminários ou workshops da área de TI',                       40.00, 'Evento Científico',      5, 8),
('Trabalho voluntário em projetos sociais ou instituições sem fins lucrativos',             20.00, 'Voluntariado',           2, 9),
('Estágio não obrigatório em empresa da área de atuação do curso',                         60.00, 'Estágio',                3, 10),
('Tutoria de alunos ingressantes com acompanhamento docente',                               30.00, 'Tutoria',                2, 1),
('Desenvolvimento de software open source com evidências de contribuição',                  40.00, 'Projeto Open Source',    4, 2),
('Organização de eventos acadêmicos ou culturais promovidos pela instituição',              30.00, 'Organização de Evento',  3, 3),
('Participação em hackathons e competições de programação',                                 30.00, 'Competição',             5, 5),
('Criação de material didático como videoaulas, apostilas ou tutoriais publicados',         20.00, 'Material Didático',      4, 6),
('Certificações de plataformas reconhecidas: AWS, Google, Microsoft, Oracle',               40.00, 'Certificação TI',        5, 7),
('Participação como ouvinte em defesas de TCC ou dissertações',                             10.00, 'Ouvinte em Defesa',      2, 8),
('Doação de sangue ou participação em campanhas solidárias institucionais',                 10.00, 'Ação Solidária',         3, 9),
('Estágio em laboratório de pesquisa institucional',                                        60.00, 'Estágio Pesquisa',       4, 10),
('Minicurso ou oficina ministrada pelo próprio aluno para a comunidade acadêmica',          20.00, 'Minicurso Ministrado',   5, 1);

-- =============================================================
-- --- MATRICULADO_EM ---
-- =============================================================

INSERT INTO Matriculado_Em (id_usuario_aluno, id_curso) VALUES
(6,  1), (7,  1), (8,  1), (9,  1), (10, 1),
(11, 1), (12, 1), (13, 1), (14, 2), (15, 2),
(16, 2), (17, 2), (18, 2), (19, 3), (20, 3),
(21, 3), (22, 3), (23, 4), (24, 4), (25, 4),
(26, 4), (27, 5), (28, 5), (29, 5), (30, 6),
(31, 6), (32, 6), (33, 7), (34, 7), (35, 7),
(36, 8), (37, 8), (38, 8), (39, 9), (40, 9),
(6,  2), (7,  3), (8,  4), (9,  5);

-- =============================================================
-- --- COORDENA ---
-- =============================================================

INSERT INTO Coordena (id_usuario_coordenador, id_curso) VALUES
(2, 1), (2, 2),
(3, 3), (3, 4),
(4, 5), (4, 6),
(5, 7), (5, 8),
(2, 9), (3, 10);

-- =============================================================
-- --- APLICA_SE_A ---
-- =============================================================

INSERT INTO Aplica_Se_A (id_curso, id_regra) VALUES
(1,  1), (1,  2), (1,  7), (1,  8), (1, 10),
(2,  2), (2,  3), (2,  6), (2, 12), (2, 16),
(3,  1), (3,  4), (3,  7), (3,  9), (3, 10),
(4,  2), (4,  5), (4,  8), (4, 11), (4, 14),
(5,  7), (5,  8), (5, 10), (5, 16), (5, 19),
(6,  1), (6,  6), (6,  7), (6, 15), (6, 20),
(7,  3), (7,  5), (7, 12), (7, 13), (7, 14),
(8,  2), (8,  6), (8, 11), (8, 12), (8, 17),
(9,  7), (9,  8), (9, 16), (9, 18), (9, 19),
(10, 4), (10, 9), (10,13), (10,18), (10,20);

-- =============================================================
-- --- CERTIFICADO ---
-- Trigger trg_criar_validacao_ao_inserir_certificado dispara automaticamente
-- Trigger trg_log_novo_certificado dispara automaticamente
-- =============================================================

INSERT INTO Certificado (nome_ocr, arquivo_imagem, carga_horaria_informada, tipo_arquivo, data_envio, data_atividade, titulo_atividade, data_ocr, carga_horario_ocr, id_area, id_usuario_aluno) VALUES
('cert_monitoria_calculo_ana.pdf',        'cert_001.pdf',  40.00, 'PDF',    '2024-03-15', '2024-01-01', 'Monitoria de Cálculo I',                               '2024-03-15', 40.00,  1, 6),
('cert_ic_redes_neurais_bruno.pdf',       'cert_002.pdf',  60.00, 'PDF',    '2024-04-02', '2023-08-01', 'Iniciação Científica em Redes Neurais',                 '2024-04-02', 60.00,  2, 7),
('cert_extensao_coding_camila.jpg',       'cert_003.jpg',  30.00, 'IMAGEM', '2024-02-20', '2024-02-10', 'Projeto de Extensão: Coding for Kids',                  NULL,         NULL,   3, 8),
('cert_empresa_junior_diego.pdf',         'cert_004.pdf',  40.00, 'PDF',    '2024-05-10', '2023-10-01', 'Empresa Júnior - Diretor de Projetos',                  '2024-05-10', 40.00,  5, 9),
('cert_aws_cloud_eduarda.pdf',            'cert_005.pdf',  20.00, 'PDF',    '2024-03-28', '2024-03-20', 'AWS Cloud Practitioner Essentials',                     '2024-03-28', 20.00,  7, 10),
('cert_hackathon_felipe.jpg',             'cert_006.jpg',  30.00, 'IMAGEM', '2024-01-18', '2024-01-12', 'Hackathon CESAR School 2024 - 2° lugar',                NULL,         NULL,   5, 11),
('cert_artigo_sistemas_gabriela.pdf',     'cert_007.pdf',  20.00, 'PDF',    '2024-06-05', '2024-04-15', 'Publicação: Artigo em Anais do SBSI 2024',              '2024-06-05', 20.00,  6, 12),
('cert_estagio_totvs_henrique.pdf',       'cert_008.pdf',  60.00, 'PDF',    '2024-02-14', '2023-07-01', 'Estágio Não Obrigatório - TOTVS S/A',                   '2024-02-14', 60.00, 10, 13),
('cert_congresso_ia_isabela.pdf',         'cert_009.pdf',  16.00, 'PDF',    '2024-07-22', '2024-07-18', 'Congresso Brasileiro de Inteligência Artificial',       '2024-07-22', 16.00,  8, 14),
('cert_voluntario_joao.jpg',              'cert_010.jpg',  20.00, 'IMAGEM', '2024-05-30', '2024-04-01', 'Voluntariado - ONG Programadores do Bem',               NULL,         NULL,   9, 15),
('cert_minicurso_python_karen.pdf',       'cert_011.pdf',  8.00,  'PDF',    '2024-03-05', '2024-03-01', 'Minicurso de Python para Iniciantes - Ministrado',      '2024-03-05', 8.00,   1, 16),
('cert_ic_blockchain_lucas.pdf',          'cert_012.pdf',  60.00, 'PDF',    '2024-08-11', '2024-01-15', 'Iniciação Científica: Blockchain em Saúde',             '2024-08-11', 60.00,  2, 17),
('cert_google_cloud_marina.pdf',          'cert_013.pdf',  40.00, 'PDF',    '2024-04-19', '2024-04-10', 'Google Cloud Associate Engineer - Certificação',        '2024-04-19', 40.00,  7, 18),
('cert_monitoria_poo_nathan.pdf',         'cert_014.pdf',  40.00, 'PDF',    '2024-02-28', '2023-08-01', 'Monitoria de Programação Orientada a Objetos',          '2024-02-28', 40.00,  1, 19),
('cert_estagio_accenture_olivia.pdf',     'cert_015.pdf',  60.00, 'PDF',    '2024-06-17', '2023-11-01', 'Estágio Não Obrigatório - Accenture Brasil',            '2024-06-17', 60.00, 10, 20),
('cert_seminario_seguranca_pedro.jpg',    'cert_016.jpg',  8.00,  'IMAGEM', '2024-01-25', '2024-01-20', 'Seminário de Segurança da Informação - FATEC',          NULL,         NULL,   8, 21),
('cert_extensao_acessibilidade_quesia.pdf','cert_017.pdf', 30.00, 'PDF',    '2024-07-08', '2024-05-01', 'Projeto de Extensão: Tecnologia e Acessibilidade',      '2024-07-08', 30.00,  3, 22),
('cert_azure_rafael.pdf',                 'cert_018.pdf',  40.00, 'PDF',    '2024-03-22', '2024-03-15', 'Microsoft Azure Fundamentals AZ-900',                   '2024-03-22', 40.00,  7, 23),
('cert_artigo_mobile_sabrina.pdf',        'cert_019.pdf',  20.00, 'PDF',    '2024-09-01', '2024-06-20', 'Publicação: Desenvolvimento Mobile Multiplataforma',    '2024-09-01', 20.00,  6, 24),
('cert_estagio_embraer_thiago.pdf',       'cert_020.pdf',  60.00, 'PDF',    '2024-05-05', '2023-12-01', 'Estágio Não Obrigatório - Embraer Digital',             '2024-05-05', 60.00, 10, 25),
('cert_empresa_junior_ursula.pdf',        'cert_021.pdf',  40.00, 'PDF',    '2024-04-14', '2023-09-01', 'Empresa Júnior - Consultora de TI',                     '2024-04-14', 40.00,  5, 26),
('cert_congresso_web_victor.jpg',         'cert_022.jpg',  16.00, 'IMAGEM', '2024-08-29', '2024-08-25', 'Workshop Web Summit Portugal 2024 - Online',            NULL,         NULL,   8, 27),
('cert_voluntario_wanessa.pdf',           'cert_023.pdf',  20.00, 'PDF',    '2024-06-30', '2024-05-10', 'Voluntariado - Instituto Ayrton Senna (TI)',             '2024-06-30', 20.00,  9, 28),
('cert_monitoria_bd_xande.pdf',           'cert_024.pdf',  40.00, 'PDF',    '2024-03-10', '2023-08-01', 'Monitoria de Banco de Dados I',                         '2024-03-10', 40.00,  1, 29),
('cert_hackathon_yasmin.jpg',             'cert_025.jpg',  30.00, 'IMAGEM', '2024-07-15', '2024-07-10', 'Hackathon Recife Tech 2024 - Finalista',                NULL,         NULL,   5, 30),
('cert_oracle_zaqueu.pdf',                'cert_026.pdf',  40.00, 'PDF',    '2024-02-08', '2024-02-01', 'Oracle Database SQL Certified Associate',                '2024-02-08', 40.00,  7, 31),
('cert_extensao_amanda.jpg',              'cert_027.jpg',  30.00, 'IMAGEM', '2024-05-21', '2024-04-20', 'Extensão Universitária - App para Comunidade',          NULL,         NULL,   3, 32),
('cert_ic_seguranca_bernardo.pdf',        'cert_028.pdf',  60.00, 'PDF',    '2024-08-18', '2024-01-20', 'Iniciação Científica: Cibersegurança em IoT',           '2024-08-18', 60.00,  2, 33),
('cert_estagio_ifpe_cecilia.pdf',         'cert_029.pdf',  60.00, 'PDF',    '2024-04-30', '2023-10-01', 'Estágio Não Obrigatório - IFPE (Laboratório)',           '2024-04-30', 60.00, 10, 34),
('cert_minicurso_git_danilo.pdf',         'cert_030.pdf',  4.00,  'PDF',    '2024-03-18', '2024-03-15', 'Minicurso de Git e GitHub - Ministrado',                '2024-03-18', 4.00,   1, 35),
('cert_congresso_ux_elisa.pdf',           'cert_031.pdf',  8.00,  'PDF',    '2024-09-10', '2024-09-05', 'UX Conf Brasil 2024 - Participação',                   '2024-09-10', 8.00,   8, 36),
('cert_artigo_devops_fabio.pdf',          'cert_032.pdf',  20.00, 'PDF',    '2024-07-27', '2024-05-30', 'Publicação: DevOps em Ambientes Educacionais',          '2024-07-27', 20.00,  6, 37),
('cert_empresa_junior_giovana.pdf',       'cert_033.pdf',  40.00, 'PDF',    '2024-06-12', '2023-11-01', 'Empresa Júnior - Analista de Sistemas',                 '2024-06-12', 40.00,  5, 38),
('cert_voluntario_hugo.jpg',              'cert_034.jpg',  20.00, 'IMAGEM', '2024-05-14', '2024-04-05', 'Voluntariado - Projeto Computadores para Todos',        NULL,         NULL,   9, 39),
('cert_aws_developer_ingrid.pdf',         'cert_035.pdf',  40.00, 'PDF',    '2024-08-05', '2024-07-28', 'AWS Certified Developer Associate',                     '2024-08-05', 40.00,  7, 40),
('cert_ic_ml_bruno.pdf',                  'cert_037.pdf',  60.00, 'PDF',    '2024-10-01', '2024-02-01', 'Iniciação Científica: Machine Learning Aplicado',       '2024-10-01', 60.00,  2, 6),
('cert_extensao_inclusao_camila.jpg',     'cert_038.jpg',  30.00, 'IMAGEM', '2024-09-20', '2024-07-01', 'Extensão: Inclusão Digital para Idosos',                NULL,         NULL,   3, 7),
('cert_kubernetes_diego.pdf',             'cert_039.pdf',  20.00, 'PDF',    '2024-10-05', '2024-09-28', 'Kubernetes Administrator - CKA',                        '2024-10-05', 20.00,  7, 8),
('cert_hackathon_edu_eduarda.pdf',        'cert_040.pdf',  30.00, 'PDF',    '2024-10-10', '2024-10-05', 'Hackathon Educação + Tecnologia 2024 - 1° lugar',       '2024-10-10', 30.00,  5, 9);

-- =============================================================
-- --- VALIDACAO ---
-- A trigger trg_criar_validacao_ao_inserir_certificado já criou
-- todos os registros com status PENDENTE.
-- Aqui atualizamos os status para simular o fluxo real.
-- Nota: trigger trg_notificacao_apos_validacao e
--       trg_log_validacao disparam automaticamente nos UPDATEs.
-- =============================================================

-- Aprovados
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 40.00, data_validacao = '2024-03-20', observacao = 'Documento válido. Horas computadas conforme regra de monitoria.' WHERE id_certificado = 41;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 60.00, data_validacao = '2024-04-08', observacao = 'Iniciação científica devidamente comprovada pelo orientador.' WHERE id_certificado = 42;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 30.00, data_validacao = '2024-02-25', observacao = 'Projeto de extensão reconhecido pela coordenação.' WHERE id_certificado = 43;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 40.00, data_validacao = '2024-05-15', observacao = 'Participação na Empresa Júnior comprovada. Cargo: Diretor de Projetos.' WHERE id_certificado = 44;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 20.00, data_validacao = '2024-04-02', observacao = 'Certificação AWS válida e reconhecida.' WHERE id_certificado = 45;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 30.00, data_validacao = '2024-01-25', observacao = 'Participação no hackathon comprovada com certificado oficial.' WHERE id_certificado = 46;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 20.00, data_validacao = '2024-06-10', observacao = 'Artigo publicado em anais com ISSN. Aprovado conforme regra de publicações.' WHERE id_certificado = 47;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 60.00, data_validacao = '2024-02-20', observacao = 'Estágio em empresa reconhecida. Carga horária máxima atingida.' WHERE id_certificado = 48;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 16.00, data_validacao = '2024-07-25', observacao = 'Participação no congresso confirmada pela programação do evento.' WHERE id_certificado = 49;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 20.00, data_validacao = '2024-06-05', observacao = 'Voluntariado devidamente documentado pela ONG.' WHERE id_certificado = 50;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 8.00,  data_validacao = '2024-03-10', observacao = 'Minicurso ministrado com lista de presença entregue.' WHERE id_certificado = 51;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 60.00, data_validacao = '2024-08-18', observacao = 'IC com relatório parcial aprovado pelo orientador.' WHERE id_certificado = 52;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 40.00, data_validacao = '2024-04-25', observacao = 'Certificação Google Cloud verificada pelo número de registro.' WHERE id_certificado = 53;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 40.00, data_validacao = '2024-03-05', observacao = 'Monitoria de POO devidamente registrada no sistema acadêmico.' WHERE id_certificado = 54;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 60.00, data_validacao = '2024-06-22', observacao = 'Estágio na Accenture validado. CTPS e carta da empresa conferidas.' WHERE id_certificado = 55;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 8.00,  data_validacao = '2024-02-01', observacao = 'Seminário com carga horária comprovada no certificado oficial.' WHERE id_certificado = 56;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 30.00, data_validacao = '2024-07-15', observacao = 'Projeto de extensão aprovado pelo comitê institucional.' WHERE id_certificado = 57;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 40.00, data_validacao = '2024-03-28', observacao = 'Certificação Azure AZ-900 verificada no portal da Microsoft.' WHERE id_certificado = 58;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 20.00, data_validacao = '2024-09-08', observacao = 'Artigo em periódico Qualis B2. Aprovado.' WHERE id_certificado = 59;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 60.00, data_validacao = '2024-05-12', observacao = 'Estágio na Embraer Digital. Documentação completa e válida.' WHERE id_certificado = 60;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 40.00, data_validacao = '2024-04-20', observacao = 'Empresa Júnior: relatório de atividades aprovado.' WHERE id_certificado = 61;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 16.00, data_validacao = '2024-09-03', observacao = 'Workshop online com certificado verificável.' WHERE id_certificado = 62;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 20.00, data_validacao = '2024-07-05', observacao = 'Voluntariado comprovado com declaração do Instituto.' WHERE id_certificado = 63;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 40.00, data_validacao = '2024-03-15', observacao = 'Monitoria de BD registrada. Aprovado.' WHERE id_certificado = 64;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 30.00, data_validacao = '2024-07-20', observacao = 'Hackathon Recife Tech: certificado de participação válido.' WHERE id_certificado = 65;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 40.00, data_validacao = '2024-02-12', observacao = 'Oracle SQL: certificação verificada no portal oficial.' WHERE id_certificado = 66;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 30.00, data_validacao = '2024-05-28', observacao = 'Extensão aprovada com relatório de impacto comunitário.' WHERE id_certificado = 67;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 60.00, data_validacao = '2024-08-25', observacao = 'IC em IoT aprovada com relatório e aceite do orientador.' WHERE id_certificado = 68;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 60.00, data_validacao = '2024-05-07', observacao = 'Estágio no IFPE: declaração de estágio e relatório aprovados.' WHERE id_certificado = 69;
UPDATE Validacao SET status = 'APROVADO', horas_validadas = 4.00,  data_validacao = '2024-03-22', observacao = 'Minicurso de Git: lista de presença e avaliação dos participantes entregues.' WHERE id_certificado = 60;

-- Reprovados
UPDATE Validacao SET status = 'REPROVADO', horas_validadas = 0.00, data_validacao = '2024-09-15', observacao = 'Documento ilegível. Solicite reenvio com imagem de melhor qualidade.' WHERE id_certificado = 70;
UPDATE Validacao SET status = 'REPROVADO', horas_validadas = 0.00, data_validacao = '2024-08-02', observacao = 'Publicação em blog pessoal não é aceita. Necessário periódico com ISSN.' WHERE id_certificado = 73;
UPDATE Validacao SET status = 'REPROVADO', horas_validadas = 0.00, data_validacao = '2024-06-18', observacao = 'Empresa Júnior não vinculada à instituição. Documento não aceito.' WHERE id_certificado = 72;
UPDATE Validacao SET status = 'REPROVADO', horas_validadas = 0.00, data_validacao = '2024-05-20', observacao = 'Carga horária no certificado diverge do informado pelo aluno.' WHERE id_certificado = 74;

-- Pendentes (não alterados — permanecem como criados pela trigger)
-- Certificados 35 a 40 permanecem PENDENTE

-- =============================================================
-- --- RECEBE (Notificações → Usuários) ---
-- As notificações foram geradas automaticamente pelas triggers.
-- Aqui vinculamos os usuarios às suas notificações.
-- =============================================================

INSERT INTO Recebe (id_usuario, id_notificacao)
SELECT cert.id_usuario_aluno, n.id_notificacao
FROM Notificacao n
JOIN Validacao v   ON v.id_validacao   = n.id_validacao
JOIN Certificado cert ON cert.id_certificado = v.id_certificado;

-- Coordenadores também recebem notificações de novos envios
INSERT INTO Recebe (id_usuario, id_notificacao) VALUES -- erro
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5),
(3, 6), (3, 7), (3, 8), (3, 9), (3, 10),
(4, 11),(4, 12),(4, 13),(4, 14),(4, 15),
(5, 16),(5, 17),(5, 18),(5, 19),(5, 20),
(2, 21),(2, 22),(2, 23),(2, 24),(2, 25),
(3, 26),(3, 27),(3, 28),(3, 29),(3, 30),
(4, 31),(4, 32),(4, 33),(4, 34);

-- =============================================================
-- --- CHAMADAS DE STORED PROCEDURES (EXEMPLOS DE USO) ---
-- =============================================================

-- Registrar logins no log (simulando autenticações reais)
CALL sp_registrar_login(6,  '189.40.12.101');
CALL sp_registrar_login(7,  '189.40.12.102');
CALL sp_registrar_login(8,  '200.175.88.50');
CALL sp_registrar_login(9,  '200.175.88.51');
CALL sp_registrar_login(10, '177.92.44.30');
CALL sp_registrar_login(2,  '192.168.1.10');
CALL sp_registrar_login(3,  '192.168.1.11');
CALL sp_registrar_login(4,  '192.168.1.12');
CALL sp_registrar_login(5,  '192.168.1.13');
CALL sp_registrar_login(1,  '192.168.1.1');

-- Verificar conclusão de carga horária de alguns alunos
CALL sp_verificar_conclusao(6,  1);  -- Ana Clara no curso ADS
CALL sp_verificar_conclusao(7,  1);  -- Bruno Henrique no curso ADS
CALL sp_verificar_conclusao(8,  1);  -- Camila Ferreira no curso ADS
CALL sp_verificar_conclusao(20, 3);  -- Olivia no curso Sistemas de Informação
CALL sp_verificar_conclusao(25, 4);  -- Thiago no curso Ciência da Computação

-- Dashboard do coordenador Fernanda (id_usuario = 2)
CALL sp_dashboard_coordenador(2);

-- Dashboard do coordenador Roberto (id_usuario = 3)
CALL sp_dashboard_coordenador(3);

-- Logs do aluno Ana Clara (id_usuario = 6)
CALL sp_logs_usuario(6, NULL);

-- Logs apenas de login do coordenador Fernanda
CALL sp_logs_usuario(2, 'LOGIN');

-- =============================================================
-- --- CONSULTAS DE VERIFICAÇÃO DAS VIEWS ---
-- =============================================================

-- Horas acumuladas de todos os alunos por curso
SELECT * FROM vw_horas_por_aluno;

-- Certificados ainda pendentes de avaliação
SELECT * FROM vw_certificados_pendentes;

-- Certificados visíveis para o coordenador Fernanda Lima (id=2)
SELECT * FROM vw_certificados_por_coordenador WHERE id_coordenador = 2;

-- Dashboard de métricas por área e curso
SELECT * FROM vw_dashboard_metricas_area;

-- Log completo de todas as ações no sistema
SELECT * FROM vw_log_completo LIMIT 50;

-- Notificações recebidas pela aluna Ana Clara (id=6)
SELECT * FROM vw_notificacoes_usuario WHERE usuario = 'Ana Clara Rodrigues';

-- =============================================================
-- FIM DO SCRIPT DE SEED - sistema_acc_seed.sql
-- =============================================================