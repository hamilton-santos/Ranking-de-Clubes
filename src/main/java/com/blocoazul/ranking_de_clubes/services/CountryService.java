package com.blocoazul.ranking_de_clubes.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.blocoazul.ranking_de_clubes.entities.Country;
import com.blocoazul.ranking_de_clubes.repositories.CountryRepository;

@Service
public class CountryService {
	
	@Autowired
	private CountryRepository repository;
	
	public List<Country> findAll() {
		return repository.findAll(Sort.by("worldCups").descending().and(Sort.by("name").ascending()));
	}

}
