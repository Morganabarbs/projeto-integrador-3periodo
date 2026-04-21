package edu.br.senac.horascomplementares.service;

import edu.br.senac.horascomplementares.dto.CadastroRequestDTO;
import edu.br.senac.horascomplementares.dto.LoginRequestDTO;
import edu.br.senac.horascomplementares.dto.LoginResponseDTO;
import edu.br.senac.horascomplementares.entities.Aluno;
import edu.br.senac.horascomplementares.entities.Coordenador;
import edu.br.senac.horascomplementares.entities.Usuario;
import edu.br.senac.horascomplementares.repository.AlunoRepository;
import edu.br.senac.horascomplementares.repository.CoordenadorRepository;
import edu.br.senac.horascomplementares.repository.UsuarioRepository;
import edu.br.senac.horascomplementares.security.JwtUtil;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private final UsuarioRepository usuarioRepo;
    private final AlunoRepository alunoRepo;
    private final CoordenadorRepository coordenadorRepo;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;

    public AuthService(UsuarioRepository usuarioRepo,
                       AlunoRepository alunoRepo,
                       CoordenadorRepository coordenadorRepo,
                       PasswordEncoder passwordEncoder,
                       JwtUtil jwtUtil) {
        this.usuarioRepo = usuarioRepo;
        this.alunoRepo = alunoRepo;
        this.coordenadorRepo = coordenadorRepo;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtil = jwtUtil;
    }

    public LoginResponseDTO login(LoginRequestDTO dto) {
        Usuario usuario = usuarioRepo.findByEmail(dto.getEmail())
            .orElseThrow(() -> new RuntimeException("Email ou senha inválidos"));

        if (!passwordEncoder.matches(dto.getSenha(), usuario.getSenha())) {
            throw new RuntimeException("Email ou senha inválidos");
        }

        // Pega o perfil real do banco
        String perfil = usuario.getClass().getSimpleName().toUpperCase();
        if (perfil.equals("USUARIO")) perfil = "ADMIN";

        String token = jwtUtil.gerarToken(usuario.getEmail(), perfil);
        return new LoginResponseDTO(token, perfil, usuario.getNome());
    }

    public void cadastrar(CadastroRequestDTO dto) {
        if (usuarioRepo.findByEmail(dto.getEmail()).isPresent()) {
            throw new RuntimeException("Email já cadastrado");
        }

        String senhaCriptografada = passwordEncoder.encode(dto.getSenha());

        switch (dto.getPerfil().toUpperCase()) {
            case "ALUNO" -> {
                Aluno aluno = new Aluno();
                aluno.setNome(dto.getNome());
                aluno.setEmail(dto.getEmail());
                aluno.setSenha(senhaCriptografada);
                aluno.setMatricula(dto.getMatricula());
                alunoRepo.save(aluno);
            }
            case "COORDENADOR" -> {
                Coordenador coord = new Coordenador();
                coord.setNome(dto.getNome());
                coord.setEmail(dto.getEmail());
                coord.setSenha(senhaCriptografada);
                coord.setDepartamento(dto.getDepartamento());
                coord.setIdCoordenador((int)(Math.random() * 90000) + 10000);
                coordenadorRepo.save(coord);
            }
            default -> throw new RuntimeException("Perfil inválido");
        }
    }
}