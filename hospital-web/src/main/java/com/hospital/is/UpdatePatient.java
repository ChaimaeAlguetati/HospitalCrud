package com.hospital.is;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hospital.is.entity.Patient;
import com.hospital.is.service.PatientService;

/**
 * Servlet implementation class UpdatePatient
 */
public class UpdatePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PatientService patientService;



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "spring-configuration.xml" });

		patientService = (PatientService) context.getBean("patientServiceImpl");
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter printWriter = response.getWriter();
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String birthdate = request.getParameter("birthdate");
		int id = Integer.parseInt(request.getParameter("id"));

		if(firstName.isEmpty()||lastName.isEmpty()||address.isEmpty()||phone.isEmpty()||birthdate.isEmpty())
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("updatePatient.jsp");
			printWriter.println("<font color=red>Please fill all the fields</font>");
			rd.include(request, response);
		}
		else
		{
			patientService.update(firstName, lastName, address, phone, birthdate);
			response.sendRedirect(request.getContextPath() + "/patient");

		}
	}

}
