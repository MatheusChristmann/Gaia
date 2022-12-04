package br.edu.unoesc.springboot.gaia.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classe de Cargo (Contem as informacoes referentes aos Cargos do sistema).
 * @author Matheus Felipe Christmann
 */
@Entity
@Table(name = "cargo")
public class Cargo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * Codigo do Cargo
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "car_cod", columnDefinition = "integer")
	private Long cod;
	
	/***
	 * Descricao do Cargo
	 */
	@Column(name="car_descricao", length = 50, nullable = false)
	private String descricao;

	/**
	 * Salario do Cargo
	 */
	@Column(name="car_salario", precision = 10, scale = 2, nullable = false)
	private Double salario;

	/**
	 * Construtor de Cargo
	 * @param descricao Descricao do Cargo
	 * @param salario Salario do Cargo
	 */	
	public Cargo(String descricao, Double salario) {
		this.descricao = descricao;
		this.salario = salario;
	}

	/**
	 * Obtem o ccdigo.
	 * @return <code>Long</code> especificando o ccdigo do cargo.
	 */
	public Long getCod() {
		return cod;
	}

	/**
	 * Obtem a descricao.
	 * @return <code>String</code> especificando a descricao do cargo.
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
	 * Obtem o salario.
	 * @return <code>Double</code> especificando o salario do cargo.
	 */
	public Double getSalario() {
		return salario;
	}
	
	/**
	 * Configura o salario.
	 * @param salario Salario.
	 */
	private void setSalario(Double salario){
		this.salario = salario;
	}
	
	/**
	 * Metodo para alterar o salario.
	 * @param valorNovo Valor novo para o salario do Cargo.
	 */
	public void alterarSalario(Double valorNovo){
		if(this.getDescricao().toUpperCase().contains("GERENTE")){
			this.setSalario(valorNovo);
		}
		else{
			if(valorNovo < 5000){
				this.setSalario(valorNovo);
			}
		}
	}
}	