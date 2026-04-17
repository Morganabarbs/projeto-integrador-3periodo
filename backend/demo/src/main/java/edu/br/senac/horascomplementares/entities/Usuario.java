package edu.br.senac.horascomplementares.entities;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "usuario")
@Inheritance(strategy = InheritanceType.JOINED) // Estratégia para Aluno e Coordenador
@Getter @Setter
public class Usuario {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_usuario")
	private Integer id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String senha;

    private String perfil;
}
