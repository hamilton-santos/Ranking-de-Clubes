package com.blocoazul.ranking_de_clubes.services;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.blocoazul.ranking_de_clubes.entities.Country;
import com.blocoazul.ranking_de_clubes.entities.Honour;
import com.blocoazul.ranking_de_clubes.entities.Summary;
import com.blocoazul.ranking_de_clubes.entities.Team;
import com.blocoazul.ranking_de_clubes.repositories.CountryRepository;
import com.blocoazul.ranking_de_clubes.repositories.HonourRepository;
import com.blocoazul.ranking_de_clubes.repositories.SummaryRepository;

@Service
public class SummaryService {
	
	@Autowired
	SummaryRepository repository;
	
	@Autowired
	CountryRepository countryRepository;
	
	@Autowired
	HonourRepository honourRepository;
	
	@Autowired
	TeamService teamService;
	
	public void calculate() {
		
		repository.deleteAll();
		
		Set<Integer> years = new HashSet<>();
		
		years.addAll(honourRepository.getAllYears());
		
		
		for (Integer year : years) {		
			for(Country country : countryRepository.findAll()) {
				for(Team team : teamService.getAllTeamsFrom(country.getId())) {
					int[] summaryHonours = new int[4];
					Arrays.fill(summaryHonours, 0);
					int points = 0;
					
					for(Honour honour : team.getHonours()) {
						if (honour.getSeason() <= year) {
							summaryHonours[honour.getTournament().getGroup().getPoints()-1]++;
							points += honour.getTournament().getGroup().getPoints();
						}
					}
					if (points > 0) {
					ArrayUtils.reverse(summaryHonours);
					Summary summary = new Summary();
					summary.setTeam(team);
					summary.setHonours(summaryHonours);
					summary.setPoints(points);
					summary.setCountry(country);
					summary.setSeason(year);
					repository.save(summary);
					}
					
				}
			}
		}
	}
	
	public List<Summary> findAll(String country, Integer year) {
		List<Summary> result = repository.findByCountry_IdAndSeason(country, year, Sort.by("points").descending().and(Sort.by("team.name")));
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
			List<Summary> lastYearItems = repository.findByTeam_IdAndSeason(item.getTeam().getId(), item.getSeason()-1);
			if (lastYearItems.isEmpty() || lastYearItems.get(0).getPosition() > item.getPosition()) {
				item.setDirection('u');
			} else {
				if (lastYearItems.get(0).getPosition() < item.getPosition()) {
					item.setDirection('d');
				}
			}
			lastPoints = item.getPoints();
		}
		return result;
	}

}