// AlunoRepository.java
package edu.br.senac.horascomplementares.repository;

import edu.br.senac.horascomplementares.entities.Aluno;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface AlunoRepository extends JpaRepository<Aluno, Integer> {
    Optional<Aluno> findByMatricula(String matricula);
    Optional<Aluno> findByEmail(String email);
}