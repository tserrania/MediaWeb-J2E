package persistance.documents;

import persistance.DocumentBiblio;

public class DVD extends DocumentBiblio {

	public DVD(int id, String titre, String auteur, String description, boolean emprunte, Integer idUser) {
		super(id, titre, auteur, description, emprunte, idUser);
	}

	@Override
	public String getType() {
		return "DVD";
	}

}
