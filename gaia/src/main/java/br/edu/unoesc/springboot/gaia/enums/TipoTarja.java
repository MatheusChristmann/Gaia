package br.edu.unoesc.springboot.gaia.enums;

/**
 * Enuemrador de Tipos de Tarja
 * @author Matheus Felipe Christmann
 */
public enum TipoTarja {
	/**
	 * Sem Tarja
	 */
	SEMTARJA("S"),
	
	/**
	 * Amarela
	 */
	AMARELA("A"),
	
	/**
	 * Vermelha
	 */
	VERMELHA("V"),
	
	/**
	 * Preta
	 */
	PRETA("P");
	
	/**
	 * Descrição do Tipo de Tarja
	 */
	private String descricao;
	
	//-------------------------------------------------------------------------------------------------//
	
	/**
	 * Configura a descricao
	 * @param descricao
	 */
	private TipoTarja(String descricao){
		this.descricao = descricao;
	}
	
	/**
	 * Obtem a descricao
	 * @return <code>String</code> especificando a descrição do Tipo de Tarja
	 */
	public String getDescricao(){
		return this.descricao;
	}
}