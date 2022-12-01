package br.edu.unoesc.springboot.gaia.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.edu.unoesc.springboot.gaia.enums.TipoMedicamento;
import br.edu.unoesc.springboot.gaia.model.PrincipioAtivo;
import br.edu.unoesc.springboot.gaia.model.Produto;
import br.edu.unoesc.springboot.gaia.repository.PrincipioAtivoRepository;
import br.edu.unoesc.springboot.gaia.repository.ProdutoRepository;

/**
 *
 * A sample greetings controller to return greeting text
 */
@RestController
public class GreetingsController {
    /**
     *
     * @param name the name to greet
     * @return greeting text
     */  
	@RequestMapping(value = "/oi", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String greetingText() {
        return "Hello World! Começa aqui o projeto Gaia...";
    }
	
	@GetMapping(value="listarProdutos")	
	  @ResponseBody
	public ResponseEntity<List<Produto>>listaProdutos(){
	    List<Produto> produtos = produtoRepository.findAll();
	    return new ResponseEntity<List<Produto>>(produtos, HttpStatus.OK) ;
	}
	
	// ----- PRODUTO ----- //
    @Autowired
	private ProdutoRepository produtoRepository;
    
	@PostMapping(value = "salvarJSONProduto")
    @ResponseBody
    public ResponseEntity<Produto> salvarJSONProduto(@RequestBody Produto produto){
    	Produto prod = produtoRepository.save(produto);
    	return new ResponseEntity<Produto>(prod, HttpStatus.CREATED);
    }
	
	@DeleteMapping(value = "deletarProduto")
	@ResponseBody
	public ResponseEntity<String> deletarProdutos(@RequestParam Long idProduto) {
		produtoRepository.deleteById(idProduto);
		return new ResponseEntity<String>("Produto excluído com sucesso!", HttpStatus.OK);
	}
	
	@GetMapping(value = "buscarProdutoId")
	@ResponseBody
	public ResponseEntity<Produto> buscarProdutoId(@RequestParam(name = "idProduto") Long idProduto){
		Produto produto = produtoRepository.findById(idProduto).get();
		return new ResponseEntity<Produto>(produto, HttpStatus.OK);
	}		
	
	@GetMapping(value = "buscarProdutoPorNome")
	@ResponseBody
	public ResponseEntity<List<Produto>>buscarProdutoPorNome(@RequestParam(name = "nome") String nome){
		List<Produto> produto = produtoRepository.buscarProdutoPorNome(nome.trim().toUpperCase());
		return new ResponseEntity<List<Produto>>(produto, HttpStatus.OK);
	}
	
	// ----- PRINCIPIO ATIVO ----- //
	@Autowired	
	private PrincipioAtivoRepository principioAtivoRepository;
	
	@PostMapping(value = "salvarJSONPrincipioAtivo")
    @ResponseBody
    public ResponseEntity<PrincipioAtivo> salvarJSONProduto(@RequestBody PrincipioAtivo prinAtivo){
		PrincipioAtivo pAtivo = principioAtivoRepository.save(prinAtivo);
    	return new ResponseEntity<PrincipioAtivo>(pAtivo, HttpStatus.CREATED);
    }
		
	@GetMapping(value = "buscarPrincipioAtivoId")
	@ResponseBody
	public ResponseEntity<PrincipioAtivo> buscarPrincipioAtivoId(@RequestParam(name = "idPrinAtivo") Long idPrinAtivo){
		PrincipioAtivo pAtivo = principioAtivoRepository.findById(idPrinAtivo).get();
		return new ResponseEntity<PrincipioAtivo>(pAtivo, HttpStatus.OK);
	}		
	
	@GetMapping(value = "buscarPrincipioAtivoPorNome")
	@ResponseBody
	public ResponseEntity<List<PrincipioAtivo>>buscarPrincipioAtivoPorNome(@RequestParam(name = "descricao") String descricao){
		List<PrincipioAtivo> pAtivo = principioAtivoRepository.buscarPrincipioAtivoPorNome(descricao.trim().toUpperCase());
		return new ResponseEntity<List<PrincipioAtivo>>(pAtivo, HttpStatus.OK);
	}
}