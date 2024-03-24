package com.blocoazul.ranking_de_clubes.entities;

import java.io.Serializable;
import java.util.Objects;

import com.blocoazul.ranking_de_clubes.entities.ids.SummaryId;
import com.blocoazul.ranking_de_clubes.enums.Direction;
import com.blocoazul.ranking_de_clubes.enums.RankType;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@IdClass(SummaryId.class)
@Table(name = "summary")
public class Summary implements Serializable, Comparable<Summary> {

	private static final long serialVersionUID = 1L;

	@Id
	@ManyToOne
	@JoinColumn(name = "team_id")
	private Team team;
	
	@Id
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="country_id")
	private Country country;
	
	@Id
	private Integer season;
	
	@Id
    @Enumerated(EnumType.STRING)
    @JsonFormat(shape = JsonFormat.Shape.STRING)
	private RankType rankType;
	
    @Enumerated(EnumType.STRING)
	private Direction direction;
	
	@JsonIgnore
	private Float position;
	
	private String css;
	
	private int[] titles;
	
	private Integer points;

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public int[] getTitles() {
		return titles;
	}

	public void setTitles(int[] titles) {
		this.titles = titles;
	}

	public Integer getPoints() {
		return points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}
	
	public Float getPosition() {
		return position;
	}
	
	public void setPosition(Float position) {
		this.position = position;
	}
	
	public void setPosition(Integer position) {
		this.position = (float) position;
	}
	
	public Integer getPlace() {
		return (int) position.floatValue();
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
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

	public Direction getDirection() {
		return direction;
	}

	public void setDirection(Direction direction) {
		this.direction = direction;
	}
	
	public String getCountryId() {
		return getCountry() != null ? getCountry().getId() : null;
	}

	public RankType getRankType() {
		return rankType;
	}

	public void setRankType(RankType rankType) {
		this.rankType = rankType;
	}

	@Override
	public int compareTo(Summary other) {
		
		int diff = 0;
		
		if (getPoints() != null && other.getPoints() != null) {
			diff = other.getPoints() - getPoints();
		}
		
		if (diff == 0) {
			return getTeam().getName().compareTo(other.getTeam().getName());
		}
		
		return diff;
	}
	
	@Override
	public boolean equals(Object object) {
		return object != null &&
				object.getClass() == Summary.class &&
				((Summary) object).hashCode() == hashCode();
		}

	@Override
	public int hashCode() {
		return Objects.hash(team.getId(), season);
	}
	
	

}
