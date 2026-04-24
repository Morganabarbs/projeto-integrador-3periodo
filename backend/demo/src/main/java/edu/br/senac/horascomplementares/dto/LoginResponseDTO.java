// dto/LoginResponseDTO.java
package edu.br.senac.horascomplementares.dto;

public class LoginResponseDTO {
    private String token;
    private String perfil;
    private String nome;
    private Integer id;

    public LoginResponseDTO(String token, String perfil, String nome, Integer id) {
        this.token = token;
        this.perfil = perfil;
        this.nome = nome;
        this.id = id;
    }

    public String getToken() { return token; }
    public String getPerfil() { return perfil; }
    public String getNome() { return nome; }
    public Integer getId() { return id; }
}