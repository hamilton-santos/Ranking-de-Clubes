package com.blocoazul.ranking_de_clubes.entities;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "teams")
public class Team implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@JsonIgnore
	private String id;
	
	private String name;
	
	@JsonIgnore
	@OneToMany(mappedBy="team")
	private List<Title> titles;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="country_id")
	private Country country;

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

	public List<Title> getTitles() {
		return titles;
	}

	public void setTitles(List<Title> titles) {
		this.titles = titles;
	}
	
	public String getLogo() {
		return getId().toLowerCase() + ".png";
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

}
