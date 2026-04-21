package edu.br.senac.horascomplementares.controller;

import org.springframework.web.bind.annotation.*;
import edu.br.senac.horascomplementares.entities.*;
import edu.br.senac.horascomplementares.repository.UsuarioRepository;

import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    private final UsuarioRepository repo;

    public UsuarioController(UsuarioRepository repo) {
        this.repo = repo;
    }

    // ADMIN lista usuários
    @GetMapping
    public List<Usuario> listar() {
        return repo.findAll();
    }

    // COORDENADOR/ADMIN cria aluno
    @PostMapping("/alunos")
    public Usuario criarAluno(@RequestBody Aluno aluno) {
        return repo.save(aluno);
    }

    // ADMIN cria coordenador
    @PostMapping("/coordenadores")
    public Usuario criarCoordenador(@RequestBody Coordenador coordenador) {
        return repo.save(coordenador);
    }
}