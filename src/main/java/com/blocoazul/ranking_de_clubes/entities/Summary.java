package com.blocoazul.ranking_de_clubes.entities;

import java.io.Serializable;
import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "summary")
public class Summary implements Serializable, Comparable<Summary> {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@JsonIgnore
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "team_id")
	private Team team;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="country_id")
	private Country country;
	
	private Integer season;
	
	private Character direction;
	
	@JsonIgnore
	private Float position;
	
	private String classe;
	
	private int[] titles;
	
	private Integer points;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

	public String getClasse() {
		return classe;
	}

	public void setClasse(String classe) {
		this.classe = classe;
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

	public Character getDirection() {
		return direction;
	}

	public void setDirection(Character direction) {
		this.direction = direction;
	}
	
	public String getCountryId() {
		return getCountry() != null ? getCountry().getId() : null;
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
