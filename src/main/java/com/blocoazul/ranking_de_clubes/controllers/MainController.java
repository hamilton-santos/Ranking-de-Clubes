package com.blocoazul.ranking_de_clubes.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blocoazul.ranking_de_clubes.data.FullData;
import com.blocoazul.ranking_de_clubes.services.ExecuteService;

@RestController
public class MainController {

	@Autowired
	private ExecuteService service;

	@PostMapping("/execute")
	public ResponseEntity<FullData> summary() {
		return ResponseEntity.status(HttpStatus.OK).body(service.execute());
	}

}
