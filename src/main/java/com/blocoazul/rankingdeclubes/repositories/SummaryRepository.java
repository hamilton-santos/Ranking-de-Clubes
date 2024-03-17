package com.blocoazul.rankingdeclubes.repositories;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.blocoazul.rankingdeclubes.entities.Summary;

@Repository
public interface SummaryRepository extends JpaRepository<Summary, Integer> {
	
	List<Summary> findByCountry_Id(String countryId, Sort sort);
	
}
