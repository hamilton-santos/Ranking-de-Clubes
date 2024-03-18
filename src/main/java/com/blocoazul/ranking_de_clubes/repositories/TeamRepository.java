package com.blocoazul.ranking_de_clubes.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.blocoazul.ranking_de_clubes.entities.Team;

@Repository
public interface TeamRepository extends JpaRepository<Team, String> {
	
	List<Team> findByCountry_Id(String countryId);
	
}
