package com.blocoazul.ranking_de_clubes.entities;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "countries")
public class Country implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	private String id;
		
	private String name;
	
	private Integer worldCups;
	
	@ManyToMany
	@JoinTable(name = "tournaments_countries",
	joinColumns = @JoinColumn(name = "country_id"),
	inverseJoinColumns = @JoinColumn(name = "tournament_id"))
	@JsonIgnore
	private Set<Tournament> tournaments;
	
	@JsonIgnore
	@OneToMany(mappedBy="country")
	private List<Team> teams;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getWorldCups() {
		return worldCups;
	}

	public void setWorldCups(Integer worldCups) {
		this.worldCups = worldCups;
	}

	public Set<Tournament> getTournaments() {
		return tournaments;
	}

	public void setTournaments(Set<Tournament> tournaments) {
		this.tournaments = tournaments;
	}

	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}

}
