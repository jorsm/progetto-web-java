package controllers.paziente;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.mail.iap.Response;

import dao.EsameDAO;
import dao.VisitaDAO;
import dto.PazienteDTO;

/**
 * Prenotazione visita dal prorio medico di base
 */
@WebServlet("/paziente/prenotaVisita")
public class PrenotaVisita extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String time = req.getParameter("time");
		Integer id_medico = Integer.parseInt(req.getParameter("id_medico"));
		Integer id_prenotazione = Integer.parseInt(req.getParameter("id_prenotazione"));

		if(time != null && id_medico != null && id_prenotazione != null) {
			
			System.out.println("Nuova data: " + time);
			
			new VisitaDAO().aggiornaDataPrenotazione(id_prenotazione, time);
			new VisitaDAO().aggiornaStato(id_prenotazione, 1);
			new VisitaDAO().aggiornaMedico(id_prenotazione, id_medico);

			
			PazienteDTO user = (PazienteDTO)req.getSession().getAttribute("user");
			
			user.getLista_esami_da_prenotare().remove(new EsameDAO().getById(id_prenotazione));
			user.getLista_esami_prenotati().add(new EsameDAO().getById(id_prenotazione));
			
			resp.sendRedirect(req.getContextPath()+"/paziente/esamiPaziente.jsp");
		}
		else {}//TODO messaggistica di errore
		}
	}
