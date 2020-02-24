package persistance;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

import mediatek2020.*;
import mediatek2020.items.*;

/**
 * classe mono-instance  dont l'unique instance est injectée dans Mediatheque
 * via une auto-déclaration dans son bloc static
 * @author Jean-François Brette 01/01/2018 / Tyefen
 *
 */

public class MediathequeData implements PersistentMediatheque {
	private static Connection connect;
	private static Statement allDocSt;
	private static PreparedStatement getUsrSt;
	private static PreparedStatement getDocSt;
	private static PreparedStatement addDocSt;
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ETUDIANT", "ETUDIANT");
			allDocSt = connect.createStatement(); 
			getUsrSt = connect.prepareStatement("SELECT * FROM UTILISATEUR WHERE login = ? AND password = ?"); 
			getDocSt = connect.prepareStatement("SELECT * FROM DOCUMENT WHERE iddoc = ?"); 
			addDocSt = connect.prepareStatement("INSERT INTO DOCUMENT(iddoc, title, author, description) VALUES(doc_seq.next, ?, ?, ?)"); 

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Mediatheque.getInstance().setData(new MediathequeData());
	}

	private MediathequeData() {
	}

	/**
	 * renvoie la liste de tous les documents de la bibliothèque
	 */
	@Override
	public List<Document> tousLesDocuments() {
		ResultSet r;
		List<Document> l = new ArrayList<>();
		try {
			r = allDocSt.executeQuery("SELECT * FROM DOCUMENT");
			while (r.next()) {
				l.add(new DocumentBiblio(r.getInt("idDoc"), r.getString("title"), r.getString("author"), r.getString("description")));
			}
			r.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return l;
	}

	/** 
	 * Récupère le User dans la BD et le renvoie
	 * si non trouvé, renvoie null
	 */
	@Override
	public Utilisateur getUser(String login, String password) {
		ResultSet r;
		Utilisateur u = null;
		synchronized(getUsrSt) {
			try {

				getUsrSt.setString(1, login);
				getUsrSt.setString(2, password);
				r = getUsrSt.executeQuery();
				if (r.next()) {
					u = new UtilisateurBiblio(r.getString("name"), r.getInt("bibliothecaire")!=0);
				}
				r.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		return u;
	}

	/**
	 * Récupère le document de numéro numDocument dans la BD et le renvoie
	 * si non trouvé, renvoie null
	 */
	@Override
	public Document getDocument(int numDocument) {
		ResultSet r;
		try {
			r = getDocSt.executeQuery();
			while (r.next()) {
				// Do something
			}
			r.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}

	@Override
	public void nouveauDocument(int type, Object... args) {
		// args[0] -> le titre
		// args [1] --> l'auteur
		// etc...
	}

}
