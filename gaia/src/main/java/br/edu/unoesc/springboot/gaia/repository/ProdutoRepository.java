package br.edu.unoesc.springboot.gaia.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.edu.unoesc.springboot.gaia.model.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>{
	@Query(value = "select p from Produto p where upper(trim(p.nome)) like %?1%")
	List<Produto> buscarProdutoPorNome(String name);
}
