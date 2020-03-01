package persistance;

import mediatek2020.items.Document;
import mediatek2020.items.EmpruntException;
import mediatek2020.items.ReservationException;
import mediatek2020.items.RetourException;
import mediatek2020.items.Utilisateur;

public class DocumentBiblio implements Document {
	private int id;
	private int type;
	private String titre;
	private String auteur;
	private String description;
	
	
	
	public DocumentBiblio(int id, int type, String titre, String auteur, String description) {
		this.id = id;
		this.titre = titre;
		this.auteur = auteur;
		this.description = description;
	}

	@Override
	public Object[] data() {
		return new Object[] {id, type, titre, auteur, description};
	}

	@Override
	public void emprunter(Utilisateur user) throws EmpruntException {
		
	}

	@Override
	public void rendre(Utilisateur user) throws RetourException {
		
	}

	@Override
	public void reserver(Utilisateur user) throws ReservationException {
		
	}

}
