package br.edu.unoesc.springboot.gaia.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.edu.unoesc.springboot.gaia.model.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>{
	/*@Query(value = "select u from Produto u where upper(trim(u.pro_nome)) like %?1%")
	List<Produto> buscarProdutoPorNome(String name);*/
}
