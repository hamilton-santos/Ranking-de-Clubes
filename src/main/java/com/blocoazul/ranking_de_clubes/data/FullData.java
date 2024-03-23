package com.blocoazul.ranking_de_clubes.data;

import java.util.List;

import com.blocoazul.ranking_de_clubes.entities.Country;
import com.blocoazul.ranking_de_clubes.entities.Summary;
import com.blocoazul.ranking_de_clubes.entities.TournamentGroup;
import com.blocoazul.ranking_de_clubes.enums.RankType;

public class FullData {

	private RankType[] rankTypes;
	private List<Country> countries;
	private List<SeasonData> seasons;
	private List<TournamentGroup> tournaments;
	private List<Summary> rows;
	private String lastUpdate;

	public RankType[] getRankTypes() {
		return rankTypes;
	}

	public void setRankTypes(RankType[] rankTypes) {
		this.rankTypes = rankTypes;
	}

	public List<Country> getCountries() {
		return countries;
	}

	public void setCountries(List<Country> countries) {
		this.countries = countries;
	}

	public List<SeasonData> getSeasons() {
		return seasons;
	}

	public void setSeasons(List<SeasonData> seasons) {
		this.seasons = seasons;
	}

	public List<TournamentGroup> getTournaments() {
		return tournaments;
	}

	public void setTournaments(List<TournamentGroup> tournaments) {
		this.tournaments = tournaments;
	}

	public List<Summary> getRows() {
		return rows;
	}

	public void setRows(List<Summary> rows) {
		this.rows = rows;
	}

	public String getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

}
