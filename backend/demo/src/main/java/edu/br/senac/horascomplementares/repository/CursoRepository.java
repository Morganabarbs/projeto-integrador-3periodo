// CursoRepository.java
package edu.br.senac.horascomplementares.repository;

import edu.br.senac.horascomplementares.entities.Curso;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CursoRepository extends JpaRepository<Curso, Integer> {
}