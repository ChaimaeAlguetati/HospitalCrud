package com.hospital.is.repository;

import java.util.List;

import com.hospital.is.entity.Patient;

public interface PatientRepository {
	void create(String firstName, String lastName, String address, String phone, String birthdate);

	void update(String firstName, String lastName, String address, String phone, String birthdate);

	void delete(int id);

	List<Patient> getAll();
	Patient findByid(int id);
}

