package edu.br.senac.horascomplementares.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.br.senac.horascomplementares.entities.Usuario;


public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
	
}
