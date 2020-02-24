package persistance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import mediatek2020.*;
import mediatek2020.items.*;

/**
 * classe mono-instance  dont l'unique instance est inject�e dans Mediatheque
 * via une auto-d�claration dans son bloc static
 * @author Jean-Fran�ois Brette 01/01/2018 / Tyefen
 *
 */

public class MediathequeData implements PersistentMediatheque {
	private static Connection connect;
	private static PreparedStatement allDocSt;
	private static PreparedStatement getUsrSt;
	private static PreparedStatement getDocSt;
	private static PreparedStatement addDocSt;
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ETUDIANT", "ETUDIANT");
			getUsrSt = connect.prepareStatement("SELECT * FROM UTILISATEUR WHERE login = ? AND password = ?"); 
			getDocSt = connect.prepareStatement("SELECT * FROM DOCUMENT WHERE iddoc = ?"); 
			getDocSt = connect.prepareStatement("INSERT INTO DOCUMENT(iddoc, title, author, description) VALUES(doc_seq.next, ?, ?, ?)"); 

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Mediatheque.getInstance().setData(new MediathequeData());
	}

	private MediathequeData() {
	}

	/**
	 * renvoie la liste de tous les documents de la biblioth�que
	 */
	@Override
	public List<Document> tousLesDocuments() {
		return null;
	}

	/** 
	 * R�cup�re le User dans la BD et le renvoie
	 * si non trouv�, renvoie null
	 */
	@Override
	public Utilisateur getUser(String login, String password) {
		return null;
	}

	/**
	 * R�cup�re le document de num�ro numDocument dans la BD et le renvoie
	 * si non trouv�, renvoie null
	 */
	@Override
	public Document getDocument(int numDocument) {
		return null;
	}

	@Override
	public void nouveauDocument(int type, Object... args) {
		// args[0] -> le titre
		// args [1] --> l'auteur
		// etc...
	}

}
