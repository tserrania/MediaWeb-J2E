package persistance;

import mediatek2020.items.Utilisateur;

public abstract class UtilisateurBiblio implements Utilisateur {

	private String nom;
	private int id;
	

	public UtilisateurBiblio(int id, String nom) {
		this.id = id;
		this.nom = nom;
	}

	@Override
	public Object[] data() {
		return new Object[]{id};
	}

	@Override
	public abstract boolean isBibliothecaire();

	@Override
	public String name() {
		return nom;
	}

}
