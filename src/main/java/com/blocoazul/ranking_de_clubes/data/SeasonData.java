package com.blocoazul.ranking_de_clubes.data;

import java.util.HashMap;
import java.util.Map;

import com.blocoazul.ranking_de_clubes.enums.RankType;

public class SeasonData {
	
	private String year;
	
	public SeasonData(Integer year) {
		this.year = String.valueOf(year);
	}

	public String getYear() {
		return year;
	}
	
	public Map<String, String> getLabels() {
		HashMap<String, String> labels = new HashMap<>();		
		for (RankType rankType : RankType.values()) {
			labels.put(rankType.name(),
					rankType.getPeriod() == null ?
							getYear() :  (Integer.parseInt(getYear()) - rankType.getPeriod() + 1) + " - " + getYear());
		}
		return labels;
	}
}
