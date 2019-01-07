package com.hospital.is;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.hospital.is.service.PatientService;

public class PatientServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private PatientService patientService;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

		context.register(HospitalConfig.class);
		context.refresh();

		patientService = (PatientService) context.getBean(PatientService.class);

		context.getAutowireCapableBeanFactory().autowireBean(this);
		try {
			PrintWriter printWriter = response.getWriter();

			printWriter.println("<html><body>");
			printWriter.println("<h1>CodeBurners</h1>");
			System.out.println(patientService.getAll().get(0));
			System.out.println(patientService.getAll().size());
			printWriter.println(patientService.getAll().size());
			printWriter.println("</html></body>");

		} catch (Exception e) {
			e.printStackTrace();
		}
		context.close();

	}

}
