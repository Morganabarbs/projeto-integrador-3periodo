package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Set;

@Entity
@Table(name = "Aluno")
@PrimaryKeyJoinColumn(name = "id_usuario")
@Getter @Setter
public class Aluno extends Usuario {

    @Column(nullable = false, unique = true)
    private String matricula;

    private Integer periodo;

    @ManyToMany
    @JoinTable(
        name = "Matriculado_Em",
        joinColumns = @JoinColumn(name = "id_usuario_aluno"),
        inverseJoinColumns = @JoinColumn(name = "id_curso")
    )
    private Set<Curso> cursos;
}