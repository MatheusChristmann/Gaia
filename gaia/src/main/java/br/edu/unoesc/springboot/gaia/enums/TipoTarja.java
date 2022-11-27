package br.edu.unoesc.springboot.gaia.enums;

public enum TipoTarja {
	SEMTARJA("S"),
	AMARELA("A"),
	VERMELHA("V"),
	PRETA("P");
	
	private String descricao;
	
	TipoTarja(String descricao){
		this.descricao = descricao;
	}
	
	public String getDescricao(){
		return this.descricao;
	}
}