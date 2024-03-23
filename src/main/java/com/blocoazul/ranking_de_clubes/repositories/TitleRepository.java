package com.blocoazul.ranking_de_clubes.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.blocoazul.ranking_de_clubes.entities.Title;

@Repository
public interface TitleRepository extends JpaRepository<Title, Integer> {
	
	@Query("select season from Title order by season ASC")
	List<Integer> getAllYearsAsc();
	
}
