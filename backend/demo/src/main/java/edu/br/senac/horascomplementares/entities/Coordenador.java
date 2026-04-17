package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Coordenador")
@PrimaryKeyJoinColumn(name = "id_usuario")
@Getter @Setter
public class Coordenador extends Usuario {

    @Column(name = "id_coordenador", nullable = false, unique = true)
    private Integer idCoordenador;

    private String departamento;
}