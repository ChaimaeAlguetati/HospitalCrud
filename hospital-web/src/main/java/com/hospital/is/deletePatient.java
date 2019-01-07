package com.hospital.is;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hospital.is.service.PatientService;

/**
 * Servlet implementation class deletePatient
 */
public class deletePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PatientService patientService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "spring-configuration.xml" });

		patientService = (PatientService) context.getBean("patientServiceImpl");
		int id = Integer.parseInt(request.getParameter("id"));
		patientService.delete(id);
		response.sendRedirect("patient");
		


	}



}
