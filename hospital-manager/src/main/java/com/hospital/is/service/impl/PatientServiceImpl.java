package com.hospital.is.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hospital.is.entity.Patient;
import com.hospital.is.repository.PatientRepository;
import com.hospital.is.service.PatientService;

@Service
public class PatientServiceImpl implements PatientService {

	@Autowired
	private PatientRepository patientRepository;

	public List<Patient> getAll() {

		return patientRepository.getAll();
	}
	public void create(String firstName,String lastName,String address,String phone,String birthdate) {
		 patientRepository.create(firstName, lastName, address, phone, birthdate);
	}
	public void update(String firstName,String lastName,String address,String phone,String birthdate) {
		 patientRepository.update(firstName, lastName, address, phone, birthdate);
	}
	public void delete(int id) {
		patientRepository.delete(id);
	}
	public Patient findByid(int id) {
		return patientRepository.findByid(id);
				
	}
}
