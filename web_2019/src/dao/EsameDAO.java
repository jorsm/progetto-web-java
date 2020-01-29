package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import dto.EsameDTO;
import dto.TipologiaEsameDTO;
import web_2019.DatabaseService;

public class EsameDAO {

	public ArrayList<EsameDTO>  getListaEsamiByUserId(int id_paziente) { 
		ArrayList<EsameDTO> listaEsami= new ArrayList<EsameDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT * FROM prenotazioni_esami WHERE id_paziente = ?");
			stmt.setInt(1, id_paziente);
			rs = stmt.executeQuery();
			while(rs.next()){
				Date data = rs.getDate("data_ora");
				int id_esame= rs.getInt("id_esame");
				int id_prenotazione= rs.getInt("id_prenotazione");
				int id_medico = rs.getInt("id_medico");
				int stato = rs.getInt("stato");
				String referto = rs.getString("referto");
				String nomeEsame = getNameById(id_esame);
				String area = getAreaById(id_esame);


				listaEsami.add(new EsameDTO(id_esame, area, id_paziente, id_medico, data, nomeEsame, referto, id_prenotazione, stato ));
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		return listaEsami;
	}

	private String getNameById(int id_esame) {
		String nomeEsame = "";
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		Statement stmt;

		try {
			stmt = conn.createStatement();
			String sql = "SELECT nome_esame FROM esami WHERE id_esame = "+id_esame+";";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				nomeEsame = rs.getString("nome_esame");
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return nomeEsame;
	}

	

	private String getAreaById(int id_esame) {
		String area = "";
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		Statement stmt;

		try {
			stmt = conn.createStatement();
			String sql = "SELECT area_esame FROM esami WHERE id_esame = "+id_esame+";";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				area = rs.getString("area_esame");
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return area;
	}

	
	public void creaPrenotazioneEsame(int id_esame, int id_paziente, String data_ora, int id_medico, int id_riferimento) {
		
		Connection conn =DatabaseService.getDbConnection();
		PreparedStatement stmt;

		try {
			String sql = "INSERT INTO public.prenotazioni_esami(id_esame, id_paziente, data_ora, id_medico, id_riferimento)	VALUES (?, ?,  TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI:SS'), ?, ?);";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_esame);
			stmt.setInt(2, id_paziente);
			stmt.setString(3, data_ora);
			stmt.setInt(4, id_medico);
			stmt.setInt(5, id_riferimento);
			stmt.executeUpdate();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public TipologiaEsameDTO getTipologiaEsame(int id_esame) {
		return new TipologiaEsameDAO().getById(id_esame);
		
	}

	

}
