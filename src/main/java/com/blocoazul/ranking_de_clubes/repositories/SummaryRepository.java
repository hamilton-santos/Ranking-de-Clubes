package com.blocoazul.ranking_de_clubes.repositories;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.blocoazul.ranking_de_clubes.entities.Summary;
import com.blocoazul.ranking_de_clubes.enums.RankType;

@Repository
public interface SummaryRepository extends JpaRepository<Summary, Integer> {
	
	List<Summary> findByCountry_Id(String countryId, Sort sort);
	
	List<Summary> findByTeam_IdAndSeasonAndRankType(String teamId, Integer season, RankType rankType);
	
}
