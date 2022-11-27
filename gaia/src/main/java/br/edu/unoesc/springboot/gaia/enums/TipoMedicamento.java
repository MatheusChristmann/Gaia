package br.edu.unoesc.springboot.gaia.enums;

public enum TipoMedicamento {
	REFERENCIA("R"),
	SIMILAR("S"),
	GENERICO("G");
	
	private String descricao;
	
	TipoMedicamento(String descricao){
		this.descricao = descricao;
	}
	
	public String getDescricao(){
		return this.descricao;
	}
}
