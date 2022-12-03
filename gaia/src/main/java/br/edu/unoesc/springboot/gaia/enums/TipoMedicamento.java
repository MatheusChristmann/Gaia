package br.edu.unoesc.springboot.gaia.enums;

public enum TipoMedicamento {
	REFERENCIA("R"),
	SIMILAR("S"),
	GENERICO("G");
	
	private String descricao;
	
	private TipoMedicamento(String descricao){
		this.descricao = descricao;
	}
	
	public String getDescricao(){
		return this.descricao;
	}
	
//	public static TipoMedicamento fromDescricao(String descricao) {
//        if(descricao == "R") {
//        	return TipoMedicamento.REFERENCIA;
//        }
//        else if(descricao == "S"){
//        	return TipoMedicamento.SIMILAR;
//        }
//        else{
//        	return TipoMedicamento.GENERICO;
//        }
//	}
	
//	@Converter(autoApply = true)
//	public class TipoMedicamentoConverter implements AttributeConverter<TipoMedicamento, String> {
//
//		@Override
//		public String convertToDatabaseColumn(TipoMedicamento valor) {
//			return valor.getDescricao();
//		}

//		@Override
//		public TipoMedicamento convertToEntityAttribute(String valor) {
//			return TipoMedicamento.fromDescricao(valor);
//		}
//	 
//	}
}