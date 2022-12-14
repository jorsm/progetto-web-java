package web_2019;

import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dto.EsameDTO;
import dto.MedicoDTO;
import dto.PazienteDTO;
import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import dto.VisitaDTO;
import utils.Logger;

public class VisitaCorrente {
	private ArrayList<String> lista_prescrizioni = new ArrayList<String>();
	private ArrayList<TipologiaEsameDTO> lista_esami = new ArrayList<TipologiaEsameDTO>();
	private ArrayList<TipologiaVisitaDTO> lista_visite = new ArrayList<TipologiaVisitaDTO>();
	private Integer id_medico;
	private String referto = null;
	PazienteDTO paziente; 
	private EsameDTO esame_corrente;
	private Integer id_prenotazione_esame_corrente;
	
	private ArrayList<VisitaDTO> visitePrenotate = new ArrayList<VisitaDTO>();//TODO rimuovere, non serve, duplicato di visita_corrente.paziente.getVisitePrenotate(id_medico);
	
	public ArrayList<TipologiaVisitaDTO> getLista_visite() {
		return lista_visite;
	}

	public Integer getId_prenotazione_esame_corrente() {
		return id_prenotazione_esame_corrente;
	}


	public void setId_prenotazione_esame_corrente(Integer id_prenotazione_esame_corrente) {
		this.id_prenotazione_esame_corrente = id_prenotazione_esame_corrente;
	}

	private int id_prenotazione_visita_corrente;


	public EsameDTO getEsame_corrente() {	
		return esame_corrente;	
	}
	
	
	public void setReferto_esame_corrente(String referto) {
		
		this.esame_corrente.setReferto(referto);
		
	}
	
	public String getReferto_esame_corrente() {
		
		return esame_corrente.getReferto();
		
	}
	
	public void setEsame_corrente(EsameDTO esame) {	
		this.esame_corrente=esame;	
	}
	
	
	public int getId_prenotazione_visita_corrente() {
		return id_prenotazione_visita_corrente;
	}

	public void setId_prenotazione_visita_corrente(int id_prenotazione_visita_corrente) {
		this.id_prenotazione_visita_corrente = id_prenotazione_visita_corrente;
	}

	public PazienteDTO getPaziente() {
		return paziente;
	}

	
	public void setPaziente(PazienteDTO paziente) {
		this.paziente = paziente;
	}
	
	
	public int getId_medico() {
		return id_medico;
	}

	public void setId_medico(int id_medico) {
		this.id_medico = id_medico;
	}

	public ArrayList<String> getLista_prescrizioni() {
		return lista_prescrizioni;
	}

	public ArrayList<TipologiaEsameDTO> getLista_esami() {
		return lista_esami;
	}
		


	public void aggiungiPrescrizione(String farmaco) {
		lista_prescrizioni.add(farmaco);		
	}

	public void aggiungiEsame(String id_esame) {
		
			int id = Integer.parseInt(id_esame);
			lista_esami.add(new TipologiaEsameDTO(id));
			
		}



	public void setLista_visite(ArrayList<TipologiaVisitaDTO> lista_visite) {
		this.lista_visite = lista_visite;
	}

	public ArrayList<VisitaDTO> getVisitePrenotate() {
		return paziente.getVisitePrenotate(id_medico);
	}

	public void setLista_prescrizioni(ArrayList<String> lista_prescrizioni) {
		this.lista_prescrizioni = lista_prescrizioni;
	}

	public void setLista_esami(ArrayList<TipologiaEsameDTO> lista_esami) {
		this.lista_esami = lista_esami;
	}

	public String getReferto() {
		return referto;
	}

	public void setReferto(String referto) {
		this.referto = referto;
	}

	
	
	
	public void aggiungiVisite(String[] id_visite) {
		for (String id_visita : id_visite) {
			int id = Integer.parseInt(id_visita);
			lista_visite.add(new TipologiaVisitaDTO(id));
		}

	}

	
	


	public JsonObject toJson() {
		JsonObject json = new JsonObject();
		try {

		JsonArray array_prescrizioni = new JsonArray();
		for (String prescrizione : lista_prescrizioni) {
			array_prescrizioni.add(prescrizione);	
		}
		json.add("lista_prescrizioni", array_prescrizioni);

		JsonArray array_esami = new JsonArray();
		for (TipologiaEsameDTO esame : lista_esami) {
			array_esami.add(esame.toJson());	
		}
		json.add("lista_esami", array_esami);

		JsonArray array_visite = new JsonArray();
		for (TipologiaVisitaDTO visita : lista_visite) {
			array_visite.add(visita.toJson());	
		}
		json.add("lista_visite", array_visite);
		
		
		json.addProperty("referto", referto);

		//Logger.log("JSON visita corrente, relativa alla  prenotazione %d: \n", id_prenotazione_visita_corrente, json.getAsString());
		return json;
		}
		catch (Exception e) {
			
			e.printStackTrace();
			
			json.addProperty("Errore", "impossibile stapare il JSON");
			
			return json;
		}


	}



}
