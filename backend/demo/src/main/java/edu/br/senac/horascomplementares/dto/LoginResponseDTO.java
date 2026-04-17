// dto/LoginResponseDTO.java
package edu.br.senac.horascomplementares.dto;

public class LoginResponseDTO {
    private String token;
    private String perfil;
    private String nome;

    public LoginResponseDTO(String token, String perfil, String nome) {
        this.token = token;
        this.perfil = perfil;
        this.nome = nome;
    }

    public String getToken() { return token; }
    public String getPerfil() { return perfil; }
    public String getNome() { return nome; }
}