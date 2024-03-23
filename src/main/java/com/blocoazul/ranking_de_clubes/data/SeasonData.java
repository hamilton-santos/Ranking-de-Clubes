package com.blocoazul.ranking_de_clubes.data;

import java.time.LocalDate;

import com.blocoazul.ranking_de_clubes.controllers.Constants;

public class SeasonData {
	
	private String year;
	
	public SeasonData(Integer year) {
		this.year = String.valueOf(year);
	}

	public String getYear() {
		return year;
	}

	public String getDynamicLabel() {
		return (getYearInt() - Constants.DYNAMIC_YEARS_PERIOD) + " - " + getYearStr();
	}
	
	public String getLabel() {
		 return	getYearStr();
	}
	
	private Integer getYearInt() {
		return Integer.parseInt(getYear());
	}
	
	private String getYearStr() {
		return LocalDate.now().getYear() <= getYearInt() ?
				getYear() + " (Parcial)" : getYear();
	}

}
