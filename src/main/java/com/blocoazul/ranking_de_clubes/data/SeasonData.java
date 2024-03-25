package com.blocoazul.ranking_de_clubes.data;

import java.time.LocalDateTime;
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
			StringBuilder label = new StringBuilder();
			label.append(getYear());
			if (rankType.getPeriod() != null) {
				label.insert(0, (getYearValue() - rankType.getPeriod() + 1) + " - ");
			}
			if (getYearValue() >= LocalDateTime.now().getYear()) {
				label.append(" (Parcial)");
			}
			labels.put(rankType.name(), label.toString());
		}
		return labels;
	}
	
	private int getYearValue() {
		return Integer.parseInt(getYear());
	}
}
