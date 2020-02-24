package persistance;

import mediatek2020.items.Utilisateur;

public class UtilisateurBiblio implements Utilisateur {

	private boolean bibliothecaire;
	private String nom;
	

	public UtilisateurBiblio(String nom, boolean bibliothecaire) {
		this.nom = nom;
		this.bibliothecaire = bibliothecaire;
	}

	@Override
	public Object[] data() {
		return new Object[]{nom, bibliothecaire};
	}

	@Override
	public boolean isBibliothecaire() {
		return bibliothecaire;
	}

	@Override
	public String name() {
		return nom;
	}

}
