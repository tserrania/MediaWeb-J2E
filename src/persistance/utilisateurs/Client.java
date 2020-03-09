package persistance.utilisateurs;

import persistance.UtilisateurBiblio;

public class Client extends UtilisateurBiblio{

	public Client(int id, String nom) {
		super(id, nom);
	}

	@Override
	public boolean isBibliothecaire() {
		return false;
	}

}
