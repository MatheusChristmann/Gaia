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
		
	@Column(name="pro_tipomedicamento", length = 1, nullable = false, columnDefinition = "char(1)")
	private Character tipoMedicamento;
	
	@Column(name="pro_tipotarja", length = 1, nullable = false, columnDefinition = "char(1)")
	private Character tipoTarja;
	
	@Column(name="pro_principioativo", nullable = true, columnDefinition = "integer")
	private Long principioAtivo;
	
	//-------------------------------------------------------------------------------------------------//
	
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

	public Character getStatus() {
		return status;
	}

	public void setStatus(Character status) {
		this.status = status;
	}	

	public Character getTipoMedicamento() {
		return tipoMedicamento;
	}

	public void setTipoMedicamento(Character tipoMedicamento) {
		this.tipoMedicamento = tipoMedicamento;
	}

	public Character getTipoTarja() {
		return tipoTarja;
	}

	public void setTipoTarja(Character tipoTarja) {
		this.tipoTarja = tipoTarja;
	}

	public Long getPrincipioAtivo() {
		return principioAtivo;
	}

	public void setPrincipioAtivo(Long principioAtivo) {
		this.principioAtivo = principioAtivo;
	}

	public Long getCod() {
		return cod;
	}

	public Double getPreco() {
		return preco;
	}
	
	public void setPreco(Double preco) {
		this.preco = preco;
	}
	
	public void alterarPreco(Double valorNovo){
		if(valorNovo >= 0 && valorNovo <= 1000){
			setPreco(valorNovo);
		}
	}
}
