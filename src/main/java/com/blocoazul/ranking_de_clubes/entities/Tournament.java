package com.blocoazul.ranking_de_clubes.entities;

import java.io.Serializable;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tournaments")
public class Tournament implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String id;
	
	@ManyToOne
	@JoinColumn(name="group_id")
	private TournamentGroup group;
	
	@ManyToMany(mappedBy = "tournaments")
	Set<Country> countries;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public TournamentGroup getGroup() {
		return group;
	}

	public void setGroup(TournamentGroup group) {
		this.group = group;
	}

	public Set<Country> getCountries() {
		return countries;
	}

	public void setCountries(Set<Country> countries) {
		this.countries = countries;
	}

}
