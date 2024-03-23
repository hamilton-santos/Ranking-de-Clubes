package com.blocoazul.ranking_de_clubes.data;

import java.util.List;

import com.blocoazul.ranking_de_clubes.entities.Country;
import com.blocoazul.ranking_de_clubes.entities.Summary;
import com.blocoazul.ranking_de_clubes.entities.TournamentGroup;

public class FullData {

	private List<Country> countries;
	private List<Integer> years;
	private List<TournamentGroup> tournaments;
	private List<Summary> rows;
	private String lastUpdate;

	public List<Country> getCountries() {
		return countries;
	}

	public void setCountries(List<Country> countries) {
		this.countries = countries;
	}

	public List<Integer> getYears() {
		return years;
	}

	public void setYears(List<Integer> years) {
		this.years = years;
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
