package com.blocoazul.ranking_de_clubes.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.blocoazul.ranking_de_clubes.entities.Honour;

@Repository
public interface HonourRepository extends JpaRepository<Honour, Integer> {
	
	@Query("select season from Honour order by season ASC")
	List<Integer> getAllYears();
	
}
