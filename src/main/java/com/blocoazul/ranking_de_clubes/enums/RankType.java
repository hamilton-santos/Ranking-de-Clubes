package com.blocoazul.ranking_de_clubes.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum RankType {
	
	DYNAMIC("Dinâmico", 10),
	ETERNAL("Eterno", null);
	
	private String label;
	private Integer period;
	
	RankType(String label, Integer period) {
		this.label = label;
		this.period = period;
	}
	
	public String getLabel() {
		return label;
	}
	
	public String getName() {
		return this.name();
	}

	public Integer getPeriod() {
		return period;
	}

	public void setPeriod(Integer period) {
		this.period = period;
	}	

}
