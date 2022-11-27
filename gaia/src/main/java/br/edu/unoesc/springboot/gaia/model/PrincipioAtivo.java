package br.edu.unoesc.springboot.gaia.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "principio_ativo")
public class PrincipioAtivo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pra_cod", columnDefinition = "integer")
	private Long cod;
	
	@Column(name="pra_descricao", length = 40, nullable = false)
	private String descricao;

	public Long getCod() {
		return cod;
	}

	public void setCod(Long cod) {
		this.cod = cod;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}