package com.blocoazul.ranking_de_clubes.controllers;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blocoazul.ranking_de_clubes.entities.Country;
import com.blocoazul.ranking_de_clubes.repositories.CountryRepository;
import com.blocoazul.ranking_de_clubes.services.SummaryService;
import com.blocoazul.ranking_de_clubes.services.TournamentGroupService;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class SummaryController {
	
	@Autowired
	SummaryService service;
	
	@Autowired
	TournamentGroupService tournamentGroupService;
	
	@Autowired
	CountryRepository countryRepository;
	
	@GetMapping("/summary")
	public ResponseEntity<Map<String, Object>> summary() throws IOException {
		service.calculate();
		HashMap<String, Object> map = new HashMap<>();
		map.put("lastUpdate", LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/YYYY HH:mm")));
		map.put("tournaments", tournamentGroupService.findAll());
		List<Country> countries = countryRepository.findAll();
		for (Country country : countries) {
			country.getRows().addAll(service.findAll(country.getId()));
		}
		map.put("countries", countries);
		ResponseEntity<Map<String, Object>> response = ResponseEntity.status(HttpStatus.OK).body(map);
		try (BufferedWriter writer = new BufferedWriter(new FileWriter("docs/data.jsonp", false))) {
			ObjectMapper mapper = new ObjectMapper();
			writer.append("angular.callbacks._0(");
			writer.append(mapper.writeValueAsString(response.getBody()));
			writer.append(")");
		}
		return response;
	}

}
