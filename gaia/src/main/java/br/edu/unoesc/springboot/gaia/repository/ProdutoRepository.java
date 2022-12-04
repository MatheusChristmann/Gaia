package br.edu.unoesc.springboot.gaia.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.edu.unoesc.springboot.gaia.model.Produto;

/**
 * Interface Repository de Produto
 * @author Matheus Felipe Christmann
 */
@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>{
	/**
	 * Metodo para buscar lista de Produtos pela descricao
	 * @param name Nome do Produto
	 * @return Lista de Produtos
	 */
	@Query(value = "select p from Produto p where upper(trim(p.nome)) like %?1%")
	List<Produto> buscarProdutoPorNome(String name);
}
