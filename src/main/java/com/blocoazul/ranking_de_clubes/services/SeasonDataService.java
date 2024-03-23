package com.blocoazul.ranking_de_clubes.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.blocoazul.ranking_de_clubes.data.SeasonData;

@Service
public class SeasonDataService {
	
	public List<SeasonData> convertYearsToSeasonData(List<Integer> years) {
		List<SeasonData> seasonDataList = new ArrayList<>();
		for (Integer year : years) {
			SeasonData seasonData = new SeasonData(year);
			seasonDataList.add(seasonData);
		}
		return seasonDataList;
	}

}
