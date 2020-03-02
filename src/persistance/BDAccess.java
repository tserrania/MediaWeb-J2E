package persistance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mediatek2020.items.EmpruntException;

public class BDAccess {
	private static Connection connect;
	private static PreparedStatement addDocSt;
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ETUDIANT", "ETUDIANT");
			addDocSt = connect.prepareStatement("INSERT INTO DOCUMENT(iddoc, type, title, author, description) VALUES(doc_seq.next, ?, ?, ?, ?)"); 
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	public static ResultSet executeAllDocs() throws SQLException {
		PreparedStatement allDocSt = connect.prepareStatement("SELECT * FROM DOCUMENT"); 
		return allDocSt.executeQuery();
	}
	public static ResultSet executeGetUser(String login, String password) throws SQLException {
		PreparedStatement getUsrSt = connect.prepareStatement("SELECT * FROM UTILISATEUR WHERE login=? AND password=?"); 
		ResultSet r;
		getUsrSt.setString(1, login);
		getUsrSt.setString(2, password);
		r = getUsrSt.executeQuery();
		return r;
	}
	public static ResultSet executeGetDoc(int numDocument) throws SQLException {
		PreparedStatement getDocSt = connect.prepareStatement("SELECT * FROM DOCUMENT WHERE iddoc = ?"); 
		ResultSet r;
		getDocSt.setInt(1, numDocument);
		r = getDocSt.executeQuery();
		return r;
	}
	public static void empruntDoc(int iddoc, int iduser) throws EmpruntException{
		PreparedStatement getDocSt = connect.prepareStatement("UPDATE DOCUMENT SET WHERE iddoc = ?"); 
		int nb = getDocSt.executeUpdate();
	}
}
