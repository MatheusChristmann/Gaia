package br.edu.unoesc.springboot.gaia.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "produto")
public class Produto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "pro_cod", columnDefinition = "integer")
	private Long cod;
	
	@Column(name="pro_nome", length = 40, nullable = false)
	private String nome;
	
	@Column(name="pro_descricao", length = 70, nullable = true)
	private String descricao;
	
	@Column(name="pro_preco", precision = 10, scale = 2, nullable = false)
	private Double preco;
	
	@Column(name="pro_status", length = 1, nullable = false, columnDefinition = "char(1)")
	private Character status;

	// ----- GETTERS and SETTERS ----- //
	
	public Long getCod() {
		return cod;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Character getStatus() {
		return status;
	}

	public void setStatus(Character status) {
		this.status = status;
	}
}
