package br.edu.unoesc.springboot.gaia.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.edu.unoesc.springboot.gaia.model.Produto;
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
    public String greetingText(@PathVariable String name) {
        return "Hello World!";
    }
    
    @Autowired
	private ProdutoRepository produtoRepository;	
    
	@RequestMapping(value = "gravarProduto", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
   	 public String gravarProduto(){	
    		Produto produto = new Produto();
    		produto.setNome("Produto");
    		produto.setDescricao(null);
    		produto.setPreco(10.0);
    		produto.setStatus('A');   		
    		produtoRepository.save(produto);
    		return "Adição concluída!";    	
    }
	
	@GetMapping(value="listarProdutos")	
	  @ResponseBody
	public ResponseEntity<List<Produto>>listaProdutos(){
	    List<Produto> produtos = produtoRepository.findAll();
	    return new ResponseEntity<List<Produto>>(produtos, HttpStatus.OK) ;
	}
	
	@PostMapping(value = "salvarProdutos")
    @ResponseBody
    public ResponseEntity<Produto> salvarProdutos(@RequestBody Produto produto){
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
	
	@PutMapping(value = "atualizarProduto")
	@ResponseBody
	public ResponseEntity<?> atualizarProduto(@RequestBody Produto produto){
		if(produto.getCod()==null) {
			return new ResponseEntity<String>("Código do Produto não informado para atualizar!", HttpStatus.OK);
		}
		Produto prod = produtoRepository.saveAndFlush(produto);
		return new ResponseEntity<Produto>(prod, HttpStatus.OK);
	}
	
	/*@GetMapping(value = "buscarProdutoPorNome")
	@ResponseBody
	public ResponseEntity<List<Produto>>buscarProdutoPorNome(@RequestParam(name = "pro_nome") String name){
		List<Produto> produto = produtoRepository.buscarProdutoPorNome(name.trim().toUpperCase());
		return new ResponseEntity<List<Produto>>(produto, HttpStatus.OK);
	}*/
}
