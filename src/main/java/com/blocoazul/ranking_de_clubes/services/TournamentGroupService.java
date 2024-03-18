package com.blocoazul.ranking_de_clubes.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.blocoazul.ranking_de_clubes.entities.TournamentGroup;
import com.blocoazul.ranking_de_clubes.repositories.TournamentGroupRepository;

@Service
public class TournamentGroupService {
	
	@Autowired
	TournamentGroupRepository repository;
	
	public List<TournamentGroup> findAll() {
		return repository.findAll(Sort.by("points").descending());
	}

}
