package com.blocoazul.ranking_de_clubes.services;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blocoazul.ranking_de_clubes.entities.Title;
import com.blocoazul.ranking_de_clubes.repositories.TitleRepository;

@Service
public class TitleService {
	
	@Autowired
	private TitleRepository repository;
	
	public List<Title> findAll() {
		return repository.findAll();
	}
	
	public Set<Integer> getAllYears() {
		HashSet<Integer> years = new HashSet<>();
		years.addAll(repository.getAllYearsAsc());
		years.add(LocalDateTime.now().getYear());
		return years;
	}
	
	public List<Integer> getAllYearsDesc() {
		List<Integer> years = new ArrayList<>();
		years.addAll(getAllYears());
		Collections.reverse(years);
		return years;
	}


}
