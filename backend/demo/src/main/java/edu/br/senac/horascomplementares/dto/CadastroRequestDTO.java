// dto/CadastroRequestDTO.java
package edu.br.senac.horascomplementares.dto;

public class CadastroRequestDTO {
    private String nome;
    private String email;
    private String senha;
    private String perfil;    // "ALUNO", "COORDENADOR" ou "ADMIN"
    private String matricula; // só para aluno
    private String departamento; // só para coordenador

    public String getNome() { return nome; }
    public String getEmail() { return email; }
    public String getSenha() { return senha; }
    public String getPerfil() { return perfil; }
    public String getMatricula() { return matricula; }
    public String getDepartamento() { return departamento; }
}