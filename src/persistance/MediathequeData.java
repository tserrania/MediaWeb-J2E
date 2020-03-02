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
	static {
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
			r = BDAccess.executeAllDocs();
			while (r.next()) {
				l.add(new DocumentBiblio(r.getInt("idDoc"), r.getInt("typeDoc"), r.getString("title"), r.getString("author"), r.getString("description")));
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
		try {
			r = BDAccess.executeGetUser(login, password);
			if (r.next()) {
				u = new UtilisateurBiblio(r.getInt("idUser"), r.getString("name"), r.getInt("bibliothecaire")!=0);
			}
			r.close();
		} catch (SQLException e) {
			e.printStackTrace();
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
		Document d = null;
		try {
			r = BDAccess.executeGetDoc(numDocument);
			if (r.next()) {
				d = new DocumentBiblio(r.getInt("idDoc"), r.getInt("type"), r.getString("title"), r.getString("author"), r.getString("description"));
			}
			r.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return d;
	}

	@Override
	public void nouveauDocument(int type, Object... args) {
		// args[0] -> le titre
		// args [1] --> l'auteur
		// etc...
	}

}
