package com.blocoazul.ranking_de_clubes.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.persistence.JoinColumn;

@Entity
@Table(name = "countries")
public class Country implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	private String id;
		
	private String name;
	
	@ManyToMany
	@JoinTable(name = "tournaments_countries",
	joinColumns = @JoinColumn(name = "country_id"),
	inverseJoinColumns = @JoinColumn(name = "tournament_id"))
	@JsonIgnore
	Set<Tournament> tournaments;
	
	@JsonIgnore
	@OneToMany(mappedBy="country")
	private List<Team> teams;
	
	@Transient
	private List<Summary> rows = new ArrayList<>();

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

	public List<Summary> getRows() {
		return rows;
	}

	public void setRows(List<Summary> rows) {
		this.rows = rows;
	}

}
