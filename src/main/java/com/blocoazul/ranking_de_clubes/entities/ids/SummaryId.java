package com.blocoazul.ranking_de_clubes.entities.ids;

import java.io.Serializable;
import java.util.Objects;

import com.blocoazul.ranking_de_clubes.entities.Country;
import com.blocoazul.ranking_de_clubes.entities.Team;
import com.blocoazul.ranking_de_clubes.enums.RankType;

public class SummaryId implements Serializable {

	private static final long serialVersionUID = 1L;
	private Team team;
	private Country country;
	private Integer season;
	private RankType rankType;

	public SummaryId() {
		super();
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Integer getSeason() {
		return season;
	}

	public void setSeason(Integer season) {
		this.season = season;
	}

	public RankType getRankType() {
		return rankType;
	}

	public void setRankType(RankType rankType) {
		this.rankType = rankType;
	}

	@Override
	public int hashCode() {
		return Objects.hash(country, season, team);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SummaryId other = (SummaryId) obj;
		return Objects.equals(country, other.country) && Objects.equals(season, other.season)
				&& Objects.equals(team, other.team);
	}

}
