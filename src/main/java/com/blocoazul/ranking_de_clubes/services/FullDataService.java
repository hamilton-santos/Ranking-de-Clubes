package com.blocoazul.ranking_de_clubes.services;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blocoazul.ranking_de_clubes.data.FullData;

@Service
public class FullDataService {

	@Autowired
	CountryService countryService;
	
	@Autowired
	TitleService titleService;
	
	@Autowired
	TournamentGroupService tournamentGroupService;
	
	@Autowired
	SummaryService summaryService;
	
	public FullData getFullData() {
		FullData data = new FullData();
		data.setCountries(countryService.findAll());
		data.setYears(titleService.getAllYearsDesc());		
		data.setTournaments(tournamentGroupService.findAll());
		data.setRows(summaryService.findAll());		
		data.setLastUpdate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")));
		return data;
	}

}
