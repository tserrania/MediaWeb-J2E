package persistance.utilisateurs;

import persistance.UtilisateurBiblio;

public class Bibliothecaire extends UtilisateurBiblio{

	public Bibliothecaire(int id, String nom) {
		super(id, nom);
	}

	@Override
	public boolean isBibliothecaire() {
		return true;
	}

}
