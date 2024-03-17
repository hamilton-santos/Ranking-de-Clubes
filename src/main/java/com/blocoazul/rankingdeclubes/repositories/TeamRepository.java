package com.blocoazul.rankingdeclubes.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.blocoazul.rankingdeclubes.entities.Team;

@Repository
public interface TeamRepository extends JpaRepository<Team, String> {
	
	List<Team> findByCountry_Id(String countryId);
	
}
