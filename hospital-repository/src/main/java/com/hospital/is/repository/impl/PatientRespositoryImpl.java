package com.hospital.is.repository.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hospital.is.entity.Patient;
import com.hospital.is.repository.PatientRepository;

@Repository
public class PatientRespositoryImpl implements PatientRepository {

	public List<Patient> getAll() {
		Configuration configuration = new Configuration();
		configuration.addAnnotatedClass(Patient.class);
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		Session session = sessionFactory.openSession();

		Criteria criteria = session.createCriteria(Patient.class);
//		criteria.add(Restrictions.ilike("firstName", "MAro"));

		Patient patient = (Patient) session.get(Patient.class, 3);

		return criteria.list();
	}
public void create(String firstName,String lastName,String address,String phone,String birthdate) {
	Configuration configuration = new Configuration();
	configuration.addAnnotatedClass(Patient.class);
	SessionFactory sessionFactory = configuration.buildSessionFactory();
	Session session = sessionFactory.openSession();

	Criteria criteria = session.createCriteria(Patient.class);
	Patient patient=new Patient();
	patient.setFirstName(firstName);
	patient.setLastName(lastName);
	patient.setAddress(address);
	patient.setPhone(phone);
	patient.setBirthdate(birthdate);
	session.save(patient);
	

}
public void update(int id,String firstName,String lastName,String address,String phone,String birthdate) {
	Configuration configuration = new Configuration();
	configuration.addAnnotatedClass(Patient.class);
	SessionFactory sessionFactory = configuration.buildSessionFactory();
	Session session = sessionFactory.openSession();

	Criteria criteria = session.createCriteria(Patient.class);
	Patient patient=this.findByid(id);
	patient.setFirstName(firstName);
	patient.setLastName(lastName);
	patient.setAddress(address);
	patient.setPhone(phone);
	patient.setBirthdate(birthdate);
	session.saveOrUpdate(patient);
	

}
public Patient findByid(int id) {
	
	Configuration configuration = new Configuration();
	configuration.addAnnotatedClass(Patient.class);
	SessionFactory sessionFactory = configuration.buildSessionFactory();
	Session session = sessionFactory.openSession();
	try {
        session.getTransaction().begin();

    	Patient patient=(Patient) session.get(Patient.class,id);

        session.getTransaction().commit();
        session.close();
    	return patient;

    }
    catch (RuntimeException e) {
        session.getTransaction().rollback();
        throw e;
    }


}
public void delete(int id) {
	Configuration configuration = new Configuration();
	configuration.addAnnotatedClass(Patient.class);
	SessionFactory sessionFactory = configuration.buildSessionFactory();
	Session session = sessionFactory.openSession();
	try {
        session.getTransaction().begin();

    	session.delete(this.findByid(id));

        session.getTransaction().commit();
        session.close();

    }
    catch (RuntimeException e) {
        session.getTransaction().rollback();
        throw e;
    }

	
}
public void update(String firstName, String lastName, String address, String phone, String birthdate) {
	// TODO Auto-generated method stub
	
}
}