package persistance.documents;

import persistance.DocumentBiblio;

public class JeuVideo extends DocumentBiblio {

	public JeuVideo(int id, String titre, String auteur, String description, boolean emprunte, Integer idUser) {
		super(id, titre, auteur, description, emprunte, idUser);
	}

	@Override
	public String getType() {
		return "Jeu Vidéo";
	}

}
