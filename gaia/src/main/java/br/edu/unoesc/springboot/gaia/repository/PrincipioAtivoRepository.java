package br.edu.unoesc.springboot.gaia.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.edu.unoesc.springboot.gaia.model.PrincipioAtivo;

/**
 * Interface Repository de Principio Ativo
 * @author Matheus Felipe Christmann
 */
public interface PrincipioAtivoRepository extends JpaRepository<PrincipioAtivo, Long>{
	/**
	 * Metodo para buscar lista de Principios Ativos pelo nome
	 * @param name Nome do Principio Ativo
	 * @return Lista de Principios Ativos
	 */
	@Query(value = "select p from PrincipioAtivo p where upper(trim(p.descricao)) like %?1%")
	List<PrincipioAtivo> buscarPrincipioAtivoPorNome(String name);
}

