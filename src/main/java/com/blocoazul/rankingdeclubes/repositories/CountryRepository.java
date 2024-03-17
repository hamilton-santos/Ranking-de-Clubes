package com.blocoazul.rankingdeclubes.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.blocoazul.rankingdeclubes.entities.Country;

@Repository
public interface CountryRepository extends JpaRepository<Country, String> {
	
}
