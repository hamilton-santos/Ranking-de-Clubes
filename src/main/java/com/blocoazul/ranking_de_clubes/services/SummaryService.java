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

import com.blocoazul.ranking_de_clubes.controllers.Constants;
import com.blocoazul.ranking_de_clubes.entities.Country;
import com.blocoazul.ranking_de_clubes.entities.Summary;
import com.blocoazul.ranking_de_clubes.entities.Team;
import com.blocoazul.ranking_de_clubes.entities.Title;
import com.blocoazul.ranking_de_clubes.enums.Direction;
import com.blocoazul.ranking_de_clubes.enums.RankType;
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

		for (RankType rankType : RankType.values()) {
			for (Integer year : years) {
				for (Country country : countryService.findAll()) {
					List<Summary> summaries = new ArrayList<>();
					for (Team team : teamService.getAllTeamsFrom(country.getId())) {
						Summary summary = generateSummary(rankType, team, year, country);
						if (summary != null) {
							summaries.add(summary);
						}
					}
					organizeSummaries(summaries);
					repository.saveAll(summaries);
				}
			}
		}
	}

	private Summary generateSummary(RankType rankType, Team team, Integer year, Country country) {
		int[] summaryTitles = new int[4];
		Arrays.fill(summaryTitles, 0);
		int points = 0;

		for (Title title : team.getTitles()) {
			if (title.getSeason() <= year
					&& (rankType == RankType.ETERNAL || title.getSeason() > year - Constants.DYNAMIC_YEARS_PERIOD)) {
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
			summary.setRankType(rankType);
			return summary;
		}
		return null;
	}

	private void organizeSummaries(List<Summary> summaries) {
		Set<Summary> tied = new HashSet<>();
		setPositions(summaries, tied);
		markTied(tied);
		setDirections(summaries);
	}

	private void setPositions(List<Summary> summaries, Set<Summary> tied) {
		Collections.sort(summaries);
		int position = 1;
		int increment = 0;
		boolean altColor = false;
		Summary lastItem = null;

		for (Summary item : summaries) {
			if (lastItem == null || item.getPoints().equals(lastItem.getPoints())) {
				item.setPosition(position);
				increment++;
				if (lastItem != null) {
					tied.add(lastItem);
					tied.add(item);
				}
			} else {
				altColor = !altColor;
				position = position + increment;
				item.setPosition(position);
				increment = 1;
			}
			if (altColor) {
				item.setCss("altColor");
			}
			lastItem = item;
		}
	}

	private void markTied(Set<Summary> tied) {
		for (Summary item : tied) {
			item.setPosition(Float.sum(item.getPosition(), 0.5f));
		}
	}

	private void setDirections(List<Summary> summaries) {

		for (Summary item : summaries) {
			List<Summary> lastYearItems = repository.findByTeam_IdAndSeasonAndRankType(item.getTeam().getId(),
					item.getSeason() - 1, item.getRankType());
			Summary lastYearItem = lastYearItems.isEmpty() ? null : lastYearItems.get(0);
			if (lastYearItem == null || lastYearItem.getPosition() > item.getPosition()) {
				item.setDirection(Direction.UP);
			} else {
				if (lastYearItems.get(0).getPosition() < item.getPosition()) {
					if (item.getPosition() - lastYearItem.getPosition() == 0.5f
							&& item.getPosition().intValue() == lastYearItem.getPosition().intValue()) {
						item.setDirection(Direction.CAUTION);
					} else {
						item.setDirection(Direction.DOWN);
					}
				}
			}
		}
	}

}
