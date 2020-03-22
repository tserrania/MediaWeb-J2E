package services;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mediatek2020.Mediatheque;
import mediatek2020.items.Document;

public class ReservationServlet extends HttpServlet{
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{ 
		HttpSession session = request.getSession(true); 
		if (session.getAttribute("utilisateur")!=null) {
			String iddoc = request.getParameter("iddoc");
			if (iddoc!=null) {
				int id = Integer.parseInt(iddoc);
				boolean valide = false;
				Document d = Mediatheque.getInstance().getDocument(id);
				if (d!=null) {
					try {
						// Bizarrement, Mediatheque.reserver appelle la méthode emprunter() du Document et non reserver()
						// Je lance donc l'UnsupportedOperationException(), ce qui aurait dû être lancé par ma méthode reserver()
						throw new UnsupportedOperationException();
						/*
						Mediatheque.getInstance().reserver(d, (Utilisateur) session.getAttribute("utilisateur"));
						valide = true;
						*/
					} catch (UnsupportedOperationException e) {
						valide = false;
					}
				}
				request.setAttribute("valide", valide);
			}
		}
		
		getServletContext().getRequestDispatcher("/reserver.jsp").forward(request, response);
	}
}
