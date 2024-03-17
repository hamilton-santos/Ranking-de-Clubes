package com.blocoazul.rankingdeclubes.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blocoazul.rankingdeclubes.entities.Team;
import com.blocoazul.rankingdeclubes.repositories.TeamRepository;

@Service
public class TeamService {
	
	@Autowired
	TeamRepository repository;
	
	public List<Team> getAllTeamsFrom(String countryId) {
		if (countryId == null) {
			return repository.findAll();
		}
		return repository.findByCountry_Id(countryId);
	}

}
