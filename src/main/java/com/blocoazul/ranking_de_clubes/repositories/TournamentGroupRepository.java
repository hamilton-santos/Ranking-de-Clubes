package com.blocoazul.ranking_de_clubes.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.blocoazul.ranking_de_clubes.entities.TournamentGroup;

@Repository
public interface TournamentGroupRepository extends JpaRepository<TournamentGroup, String> {

}
