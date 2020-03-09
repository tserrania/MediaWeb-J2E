package persistance.documents;

import persistance.DocumentBiblio;

public class Livre extends DocumentBiblio {

	public Livre(int id, String titre, String auteur, String description, boolean emprunte, Integer idUser) {
		super(id, titre, auteur, description, emprunte, idUser);
	}

	@Override
	public String getType() {
		return "Livre";
	}

}
