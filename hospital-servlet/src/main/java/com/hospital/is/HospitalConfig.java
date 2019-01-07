package com.hospital.is;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.hospital.is.service.PatientService;

@ComponentScan(basePackages = { "com.hospital.is.service", "com.hospital.is.repository" })
@Configuration
public class HospitalConfig {

	@Autowired
	public PatientService getPatientService(PatientService patientService) {
		return patientService;
	}
}