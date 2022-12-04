package br.edu.unoesc.springboot.gaia.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classe de Produto (Contem as informacoes referente aos produtos do sistema).
 * @author Matheus Felipe Christmann
 */
@Entity
@Table(name = "produto")
public class Produto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * Codigo do Produto
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "pro_cod", columnDefinition = "integer")
	private Long cod;
	
	/**
	 * Nome do Produto
	 */
	@Column(name="pro_nome", length = 40, nullable = false)
	private String nome;
	
	/**
	 * Descricao do Produto
	 */
	@Column(name="pro_descricao", length = 70, nullable = true)
	private String descricao;
	
	/**
	 * Preco do Produto
	 */
	@Column(name="pro_preco", precision = 10, scale = 2, nullable = false)
	private Double preco;
	
	/**
	 * Status do Produto
	 */
	@Column(name="pro_status", length = 1, nullable = false, columnDefinition = "char(1)")
	private Character status;
		
	/**
	 * Tipo de Medicamento do Produto
	 */
	@Column(name="pro_tipomedicamento", length = 1, nullable = false, columnDefinition = "char(1)")
	private Character tipoMedicamento;
	
	/**
	 * Tipo de Tarja do Produto
	 */
	@Column(name="pro_tipotarja", length = 1, nullable = false, columnDefinition = "char(1)")
	private Character tipoTarja;
	
	/**
	 * Principio Ativo do Produto
	 */
	@Column(name="pro_principioativo", nullable = true, columnDefinition = "integer")
	private Long principioAtivo;
	
	//-------------------------------------------------------------------------------------------------//
	/**
	 * Contrutor de Produto (Sem descricao, campo nao obrigatorio).
	 * @param nome Nome do Produto
	 * @param preco Preco do Produto
	 * @param status Status do Produto (A = Ativo ou I = Inativo)
	 * @param tipoMedicamento Tipo de Medicamento do Produto (R = Referencia, G = Generico ou S = Similar)
	 * @param tipoTarja Tipo de Tarja do Produto (S = Sem Tarja, A = Amarela, V = Vermelha ou P = Preta)
	 * @param principioAtivo Principio Ativo do Produto.
	 */
	public Produto(String nome, Double preco, Character status, Character tipoMedicamento, Character tipoTarja, Long principioAtivo) {
		this.nome = nome;
		this.preco = preco;
		this.status = status;
		this.tipoMedicamento = tipoMedicamento;
		this.tipoTarja = tipoTarja;
		this.principioAtivo = principioAtivo;
	}
	
	/**
	 * Contrutor de Produto (Com descricao, campo nao obrigatorio)
	 * @param nome Nome do Produto
	 * @param descricao Descricao(Observacoes) do Produto
	 * @param preco Preco do Produto
	 * @param status Status do Produto (A = Ativo ou I = Inativo)
	 * @param tipoMedicamento Tipo de Medicamento do Produto (R = Referencia, G = Generico ou S = Similar)
	 * @param tipoTarja Tipo de Tarja do Produto (S = Sem Tarja, A = Amarela, V = Vermelha ou P = Preta)
	 * @param principioAtivo Principio Ativo do Produto.
	 */
	public Produto(String nome, String descricao, Double preco, Character status, Character tipoMedicamento, Character tipoTarja, Long principioAtivo) {
		this.nome = nome;
		this.descricao = descricao;
		this.preco = preco;
		this.status = status;
		this.tipoMedicamento = tipoMedicamento;
		this.tipoTarja = tipoTarja;
		this.principioAtivo = principioAtivo;
	}
	
	/**
	 * Obtem o Codigo.
	 * @return <code>Long</code> especificando o Codigo do Produto.
	 */
	public Long getCod() {
		return cod;
	}
	
	/**
	 * Obtem o Nome.
	 * @return <code>String</code> especificando o nome do Produto.
	 */
	public String getNome() {
		return nome;
	}	

	/**
	 * Configura o nome.
	 * @param nome Nome.
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}

	/**
	 * Obtem a Descricao.
	 * @return <code>String</code> especificando a descricao do Produto.
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * Configura a descricao.
	 * @param descricao Descricao.
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * Obtem o Status.
	 * @return <code>Character</code> especificando o status do Produto.
	 */
	public Character getStatus() {
		return status;
	}

	/**
	 * Configura o status.
	 * @param status Status.
	 */
	public void setStatus(Character status) {
		this.status = status;
	}	

	/**
	 * Obtem o Tipo de Medicamento.
	 * @return <code>Character</code> especificando o Tipo de Medicamento do Produto.
	 */
	public Character getTipoMedicamento() {
		return tipoMedicamento;
	}

	/**
	 * Configura o Tipo de Medicamento.
	 * @param tipoMedicamento Tipo de Medicamento.
	 */
	public void setTipoMedicamento(Character tipoMedicamento) {
		this.tipoMedicamento = tipoMedicamento;
	}

	/**
	 * Obtem o Tipo de Tarja.
	 * @return <code>Character</code> especificando o Tipo de Tarja do Produto.
	 */
	public Character getTipoTarja() {
		return tipoTarja;
	}

	/**
	 * Configura o Tipo de Tarja.
	 * @param tipoTarja Tipo de Tarja.
	 */
	public void setTipoTarja(Character tipoTarja) {
		this.tipoTarja = tipoTarja;
	}

	/**
	 * Obtem o Principio Ativo.
	 * @return <code>Long</code> especificando o Principio Ativo do Produto.
	 */
	public Long getPrincipioAtivo() {
		return principioAtivo;
	}

	/**
	 * Configura o Principio Ativo.
	 * @param principioAtivo Principio Ativo.
	 */
	public void setPrincipioAtivo(Long principioAtivo) {
		this.principioAtivo = principioAtivo;
	}

	/**
	 * Obtem o Preco.
	 * @return <code>Double</code> especificando o Preco do Produto.
	 */
	public Double getPreco() {
		return preco;
	}
	
	/**
	 * Configura o Preco.
	 * @param preco Preco.
	 */
	private void setPreco(Double preco) {
		this.preco = preco;
	}
	
	/**
	 * Metodo para alterar o salario.
	 * @param valorNovo Valor novo para o preco do Produto.
	 */
	public void alterarPreco(Double valorNovo){
		if(valorNovo >= 0 && valorNovo <= 1000){
			setPreco(valorNovo);
		}
	}
}
