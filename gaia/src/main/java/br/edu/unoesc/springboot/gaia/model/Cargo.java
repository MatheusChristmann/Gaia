package br.edu.unoesc.springboot.gaia.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cargo")
public class Cargo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "car_cod", columnDefinition = "integer")
	private Long cod;
	
	@Column(name="car_descricao", length = 50, nullable = false)
	private String descricao;

	@Column(name="car_salario", precision = 10, scale = 2, nullable = false)
	private Double salario;

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

	public Double getSalario() {
		return salario;
	}
}	