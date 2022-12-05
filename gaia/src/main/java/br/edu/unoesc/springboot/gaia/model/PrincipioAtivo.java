package br.edu.unoesc.springboot.gaia.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classe de Principio Ativo (Contem as informacoes referentes aos Principios Ativos do sistema).
 * @author Matheus Felipe Christmann
 */
@Entity
@Table(name = "principio_ativo")
public class PrincipioAtivo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * Codigo do Principio Ativo.
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pra_cod", columnDefinition = "integer")
	private Long cod;
	
	/**
	 * Descricao do Principio Ativo
	 */
	@Column(name="pra_descricao", length = 40, nullable = false)
	private String descricao;
		
	//-------------------------------------------------------------------------------------------------//
	
	/**
	 * Construtor vazio de Principio Ativo.
	 */
	public PrincipioAtivo() {
	}
	
	/**
	 * Construtor de Principio Ativo.
	 * @param descricao Descricao do Principio Ativo.
	 */
	public PrincipioAtivo(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * Obtem o codigo.
	 * @return <code>Long</code> especificando o codigo do principio ativo.
	 */
	public Long getCod() {
		return cod;
	}

	/**
	 * Obtem a descricao.
	 * @return <code>String</code> especificando a descricao do principio ativo.
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
}