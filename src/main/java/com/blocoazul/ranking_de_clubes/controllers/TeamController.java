package com.blocoazul.ranking_de_clubes.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blocoazul.ranking_de_clubes.entities.Team;
import com.blocoazul.ranking_de_clubes.repositories.TeamRepository;

@RestController
public class TeamController {
	
	@Autowired
	TeamRepository repository;
	
	@GetMapping("/teams")
	public ResponseEntity<List<Team>> getTeams() {
		return ResponseEntity.status(HttpStatus.OK).body(repository
				.findByCountry_Id("BRAZIL"));
	}

}