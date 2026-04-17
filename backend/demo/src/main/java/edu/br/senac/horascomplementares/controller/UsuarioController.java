package edu.br.senac.horascomplementares.controller;

import org.springframework.web.bind.annotation.*;
import edu.br.senac.horascomplementares.repository.UsuarioRepository;
import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {
	private final UsuarioRepository repo;

    public UsuarioController(UsuarioRepository repo) {
        this.repo = repo;
    }

    @GetMapping
    public List<UsuarioRepository> listar() {
        return repo.findAll();
    }

}
