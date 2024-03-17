package com.blocoazul.rankingdeclubes.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.blocoazul.rankingdeclubes.entities.TournamentGroup;

@Repository
public interface TournamentGroupRepository extends JpaRepository<TournamentGroup, String> {

}
