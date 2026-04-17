package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Set;

@Entity
@Table(name = "Coordenador")
@DiscriminatorValue("COORDENADOR")
@PrimaryKeyJoinColumn(name = "id_usuario")
@Getter @Setter
public class Coordenador extends Usuario {

    @Column(name = "id_coordenador", nullable = false, unique = true)
    private Integer idCoordenador;

    private String departamento;

    @ManyToMany
    @JoinTable(
        name = "Coordena",
        joinColumns = @JoinColumn(name = "id_usuario_coordenador"),
        inverseJoinColumns = @JoinColumn(name = "id_curso")
    )
    private Set<Curso> cursos;
}