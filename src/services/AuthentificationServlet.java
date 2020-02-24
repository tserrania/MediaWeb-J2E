package services;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mediatek2020.Mediatheque;
import mediatek2020.items.Utilisateur;

public class AuthentificationServlet extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{ 
		HttpSession session = request.getSession(true); 
		String login = (String) request.getParameter("login");
		String password = (String) request.getParameter("password");
		boolean valide = true;
		if (login!=null && password!=null) {
			Utilisateur u = Mediatheque.getInstance().getUser(login, password);
			if (u!=null) {
				session.setAttribute("utilisateur", u);
				getServletContext().getRequestDispatcher("/accueil.jsp").forward(request, response);
			} else {
				valide = false;
			}
		}
		request.setAttribute("valide", valide);
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{ 
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}
}
