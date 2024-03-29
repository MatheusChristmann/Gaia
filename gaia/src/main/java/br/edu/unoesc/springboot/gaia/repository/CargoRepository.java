package br.edu.unoesc.springboot.gaia.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.edu.unoesc.springboot.gaia.model.Cargo;

/**
 * Interface Repository de Cargo
 * @author Matheus Felipe Christmann
 */
@Repository
public interface CargoRepository extends JpaRepository<Cargo, Long>{
	/**
	 * Metodo para buscar lista de cargos pela descricao
	 * @param descricao Descricao do Cargo
	 * @return Lista de Cargos
	 */
	@Query(value = "select c from Cargo c where upper(trim(c.descricao)) like %?1%")
	List<Cargo> buscarCargoPorDescricao(String descricao);
}

