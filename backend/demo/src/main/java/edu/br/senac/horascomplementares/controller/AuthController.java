package edu.br.senac.horascomplementares.controller;

import edu.br.senac.horascomplementares.dto.CadastroRequestDTO;
import edu.br.senac.horascomplementares.dto.LoginRequestDTO;
import edu.br.senac.horascomplementares.dto.LoginResponseDTO;
import edu.br.senac.horascomplementares.service.AuthService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponseDTO> login(@RequestBody LoginRequestDTO dto) {
        return ResponseEntity.ok(authService.login(dto));
    }

    @PostMapping("/cadastro")
    public ResponseEntity<String> cadastrar(@RequestBody CadastroRequestDTO dto) {
        authService.cadastrar(dto);
        return ResponseEntity.ok("Usuário cadastrado com sucesso!");
    }
}