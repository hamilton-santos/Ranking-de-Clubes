package com.blocoazul.ranking_de_clubes.services;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

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
		return repository.findAll(Sort.by("rankType")
				.and(Sort.by("country"))
				.and(Sort.by("position"))
				.and(Sort.by("team"))
				);
	}

	public void calculate() {

		repository.deleteAll();

		for (RankType rankType : RankType.values()) {
			for (Integer year : titleService.getAllYears()) {
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
		int[] summaryTitles = new int[5];
		Arrays.fill(summaryTitles, 0);
		BigDecimal points = new BigDecimal("0.0");

		for (Title title : team.getTitles()) {
			if (title.getSeason() <= year
					&& (rankType.getPeriod() == null || title.getSeason() > (year - rankType.getPeriod()))) {
				summaryTitles[title.getTournament().getGroup().getOrder() - 1]++;
				points = points.add(title.getTournament().getGroup().getPoints());
			}
		}
		if (points.compareTo(BigDecimal.ZERO) > 0) {
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
			item.setPosition(item.getPosition().add(BigDecimal.valueOf(searchElementsTied(item, tied) * 0.01f)));
		}
	}
	
	private int searchElementsTied(Summary item, Set<Summary> tied) {
		int result = 0;
		for (Summary obj : tied) {
			if (item.getCountry().getId().equals(obj.getCountry().getId())
					&& item.getSeason().equals(obj.getSeason())
					&& item.getPoints().equals(obj.getPoints())) {
				result++;
			}
		}
		return result;
	}

	private void setDirections(List<Summary> summaries) {

		for (Summary item : summaries) {
			List<Summary> lastYearItems = repository.findByTeam_IdAndSeasonAndRankType(item.getTeam().getId(),
					item.getSeason() - 1, item.getRankType());
			Summary lastYearItem = lastYearItems.isEmpty() ? null : lastYearItems.get(0);
			if (lastYearItem == null || lastYearItem.getPosition().compareTo(item.getPosition()) == 1) {
				item.setDirection(Direction.UP);
			} else {
				if (lastYearItems.get(0).getPosition().compareTo(item.getPosition()) == -1) {
					if (item.getPosition().subtract(lastYearItem.getPosition()).compareTo(BigDecimal.ONE) == -1
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
