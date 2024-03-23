package com.blocoazul.ranking_de_clubes.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum RankType {
	
	DYNAMIC("Dinâmico"),
	ETERNAL("Eterno");
	
	private String label;
	
	RankType(String label) {
		this.label = label;
	}
	
	public String getLabel() {
		return label;
	}
	
	public String getName() {
		return this.name();
	}

}
