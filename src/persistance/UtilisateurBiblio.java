package persistance;

import mediatek2020.items.Utilisateur;

public class UtilisateurBiblio implements Utilisateur {

	private boolean bibliothecaire;
	private String nom;
	private int id;
	

	public UtilisateurBiblio(int id, String nom, boolean bibliothecaire) {
		this.id = id;
		this.nom = nom;
		this.bibliothecaire = bibliothecaire;
	}

	@Override
	public Object[] data() {
		return new Object[]{id};
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
