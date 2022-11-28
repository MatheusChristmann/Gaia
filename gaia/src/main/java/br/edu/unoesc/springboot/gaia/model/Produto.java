package br.edu.unoesc.springboot.gaia.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import br.edu.unoesc.springboot.gaia.enums.TipoMedicamento;
import br.edu.unoesc.springboot.gaia.enums.TipoTarja;

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
	
	@Column(name="pro_tipmedicamento", length = 1, nullable = true, columnDefinition = "char(1)")
	@Enumerated(EnumType.STRING)
	private TipoMedicamento tipoMedicamento;
	
	@Column(name="pro_tiptarja", length = 1, nullable = true, columnDefinition = "char(1)")
	@Enumerated(EnumType.STRING)
	private TipoTarja tipoTarja;
	
	@ManyToOne
	@JoinColumn(name="pro_principioativo", nullable = true)
	PrincipioAtivo prinipioAtivo;

	// ----- GETTERS and SETTERS ----- //
	
	public Long getCod() {
		return cod;
	}

	public void setCod(Long cod) {
		this.cod = cod;
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

	public TipoMedicamento getTipoMedicamento() {
		return tipoMedicamento;
	}

	public void setTipoMedicamento(TipoMedicamento tipoMedicamento) {
		this.tipoMedicamento = tipoMedicamento;
	}

	public TipoTarja getTipoTarja() {
		return tipoTarja;
	}

	public void setTipoTarja(TipoTarja tipoTarja) {
		this.tipoTarja = tipoTarja;
	}

	public PrincipioAtivo getPrinipioAtivo() {
		return prinipioAtivo;
	}

	public void setPrinipioAtivo(PrincipioAtivo prinipioAtivo) {
		this.prinipioAtivo = prinipioAtivo;
	}	
}
