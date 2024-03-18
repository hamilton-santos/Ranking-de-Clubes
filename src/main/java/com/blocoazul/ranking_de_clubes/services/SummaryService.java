package com.blocoazul.ranking_de_clubes.services;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.blocoazul.ranking_de_clubes.entities.Country;
import com.blocoazul.ranking_de_clubes.entities.Honour;
import com.blocoazul.ranking_de_clubes.entities.Summary;
import com.blocoazul.ranking_de_clubes.entities.Team;
import com.blocoazul.ranking_de_clubes.repositories.CountryRepository;
import com.blocoazul.ranking_de_clubes.repositories.SummaryRepository;

@Service
public class SummaryService {
	
	@Autowired
	SummaryRepository repository;
	
	@Autowired
	CountryRepository countryRepository;
	
	@Autowired
	TeamService teamService;
	
	public void calculate() {
		
		repository.deleteAll();
		
		for(Country country : countryRepository.findAll()) {
			for(Team team : teamService.getAllTeamsFrom(country.getId())) {
				int[] summaryHonours = new int[4];
				Arrays.fill(summaryHonours, 0);
				int points = 0;
				
				for(Honour honour : team.getHonours()) {
					summaryHonours[honour.getTournament().getGroup().getPoints()-1]++;
					points += honour.getTournament().getGroup().getPoints();	
				}
				
				ArrayUtils.reverse(summaryHonours);
				Summary summary = new Summary();
				summary.setTeam(team);
				summary.setHonours(summaryHonours);
				summary.setPoints(points);
				summary.setCountry(country);
				repository.save(summary);
				
			}
		}
	}
	
	public List<Summary> findAll(String country) {
		List<Summary> result = repository.findByCountry_Id(country, Sort.by("points").descending().and(Sort.by("team.name")));
		int position = 1;
		int lastPoints = -1;
		int increment = 0;
		boolean flip = false;
		
		for (Summary item : result) {
			if (lastPoints == -1 || item.getPoints() == lastPoints) {
				item.setPosition(position);
				increment++;
			} else {
				flip = !flip;
				position = position+increment;
				item.setPosition(position);
				increment = 1;
			}
			if (flip) {
				item.setClasse("flip");
			}
			lastPoints = item.getPoints();
		}
		return result;
	}

}
