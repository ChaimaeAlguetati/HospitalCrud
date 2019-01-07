package com.hospital.is;

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

public class PatientServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private PatientService patientService;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "spring-configuration.xml" });

		patientService = (PatientService) context.getBean("patientServiceImpl");
		try {
			List<Patient> listPatient =patientService.getAll();
//			String firstName = listPatient.get(0).getFirstName();
			request.setAttribute("listPatient", listPatient);
			RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/views/bonjour.jsp");
			rd.forward(request, response);

			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
