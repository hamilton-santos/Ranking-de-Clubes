package com.blocoazul.ranking_de_clubes.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blocoazul.ranking_de_clubes.entities.Country;
import com.blocoazul.ranking_de_clubes.entities.Summary;
import com.blocoazul.ranking_de_clubes.entities.Team;
import com.blocoazul.ranking_de_clubes.entities.Title;
import com.blocoazul.ranking_de_clubes.repositories.SummaryRepository;

@Service
public class SummaryService {

	@Autowired
	SummaryRepository repository;

	@Autowired
	CountryService countryService;

	@Autowired
	TitleService titleService;

	@Autowired
	TeamService teamService;
	
	public List<Summary> findAll() {
		return repository.findAll();
	}

	public void calculate() {

		repository.deleteAll();

		Set<Integer> years = new HashSet<>();

		years.addAll(titleService.getAllYears());

		for (Integer year : years) {
			for (Country country : countryService.findAll()) {
				List<Summary> summaries = new ArrayList<>();
				for (Team team : teamService.getAllTeamsFrom(country.getId())) {
					Summary summary = generateSummary(team, year, country);
					if (summary != null) {
						summaries.add(summary);
					}
				}
				organizeSummaries(summaries);
				repository.saveAll(summaries);
			}
		}
	}

	public Summary generateSummary(Team team, Integer year, Country country) {
		int[] summaryTitles = new int[4];
		Arrays.fill(summaryTitles, 0);
		int points = 0;

		for (Title title : team.getTitles()) {
			if (title.getSeason() <= year) {
				summaryTitles[title.getTournament().getGroup().getPoints() - 1]++;
				points += title.getTournament().getGroup().getPoints();
			}
		}
		if (points > 0) {
			ArrayUtils.reverse(summaryTitles);
			Summary summary = new Summary();
			summary.setTeam(team);
			summary.setTitles(summaryTitles);
			summary.setPoints(points);
			summary.setCountry(country);
			summary.setSeason(year);
			return summary;
		}
		return null;
	}

	public void organizeSummaries(List<Summary> summaries) {
		Collections.sort(summaries);
		int position = 1;
		int lastPoints = -1;
		int increment = 0;
		boolean altColor = false;

		for (Summary item : summaries) {
			if (lastPoints == -1 || item.getPoints() == lastPoints) {
				item.setPosition(position);
				increment++;
			} else {
				altColor = !altColor;
				position = position + increment;
				item.setPosition(position);
				increment = 1;
			}
			if (altColor) {
				item.setClasse("altColor");
			}
			List<Summary> lastYearItems = repository.findByTeam_IdAndSeason(item.getTeam().getId(),
					item.getSeason() - 1);
			if (lastYearItems.isEmpty() || lastYearItems.get(0).getPosition() > item.getPosition()) {
				item.setDirection('u');
			} else {
				if (lastYearItems.get(0).getPosition() < item.getPosition()) {
					item.setDirection('d');
				}
			}
			lastPoints = item.getPoints();
		}
	}

}
