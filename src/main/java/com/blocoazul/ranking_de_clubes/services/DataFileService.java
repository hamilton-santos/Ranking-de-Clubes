package com.blocoazul.ranking_de_clubes.services;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class DataFileService {
	
	public void generateFile(Object data) {
		try (BufferedWriter writer = new BufferedWriter(new FileWriter("docs/data.jsonp", false))) {
			ObjectMapper mapper = new ObjectMapper();
			writer.append("angular.callbacks._0(");
			writer.append(mapper.writeValueAsString(data));
			writer.append(")");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
