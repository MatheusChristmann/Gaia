package br.edu.unoesc.springboot.gaia.enums;

/**
 * Enumerador de Tipos de Medicamento
 * @author Matheus Felipe Christmann
 */
public enum TipoMedicamento {
	/**
	 * Referencia
	 */
	REFERENCIA("R"),
	
	/**
	 * Similar
	 */
	SIMILAR("S"),
	
	/**
	 * Generico
	 */
	GENERICO("G");
	
	/**
	 * Descrição do Tipo de Medicamento
	 */
	private String descricao;
	
	//-------------------------------------------------------------------------------------------------//
	
	/**
	 * Configura a descricao.
	 * @param descricao Descricao.
	 */
	private TipoMedicamento(String descricao){
		this.descricao = descricao;
	}
	
	/**
	 * Obtem a descricao.
	 * @return <code>String</code> especificando a descricao do Tipo de Medicamento.
	 */
	public String getDescricao(){
		return this.descricao;
	}
}