package com.blocoazul.ranking_de_clubes.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blocoazul.ranking_de_clubes.data.FullData;

@Service
public class ExecuteService {
	
	@Autowired
	SummaryService summaryService;
	
	@Autowired
	FullDataService fullDataService;

	@Autowired
	DataFileService dataFileService;
	
	public FullData execute() {
		summaryService.calculate();
		FullData data = fullDataService.getFullData();
		dataFileService.generateFile(data);
		return data;
	}

}
