package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Admin")
@DiscriminatorValue("ADMIN")
@PrimaryKeyJoinColumn(name = "id_usuario")
@Getter @Setter
public class Admin extends Usuario {
 
    @Column(name = "codigo_admin", unique = true)
    private String codigoAdmin; 

}