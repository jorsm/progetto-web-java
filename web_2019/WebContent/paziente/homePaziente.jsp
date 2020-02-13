<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>

<!-- Bootstrap -->

<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../css/custom.css" rel="stylesheet" type="text/css">
<link href="../css/card_hover.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/fontawesome-pro-5.12.0-web/css/all.css">


</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
		<a class="navbar-brand" href="#">${user.nome} ${user.cognome}</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a onclick="loadingModal()" class="nav-link" href="./homePaziente.jsp">Home <span
						class="sr-only">
							 
						</span></a></li>
				<li class="nav-item "><a class="nav-link" onclick="loadingModal()" href="./dettagliPaziente.jsp"
					id="navbarDropdown" role="button" 
					aria-haspopup="true" aria-expanded="false"> Dati Personali </a></li>
				<li class="nav-item"><a onclick="loadingModal()" class="nav-link" href="./medicoBasePaziente.jsp" role="button"
					 aria-haspopup="true" aria-expanded="false">
						Medico </a></li>
				<li class="nav-item"><a  onclick="loadingModal()" class="nav-link " href="./ricettePaziente.jsp"
					role="button" aria-haspopup="true" aria-expanded="false">
						Ricette <span class="badge badge-pill badge-warning">${user.getRicetteNonErogate().size()}</span>
				</a></li>
				<li class="nav-item"><a  onclick="loadingModal()" class="nav-link" href="./visitePaziente.jsp" role="button"
					 aria-haspopup="true" aria-expanded="false">
						Visite <span class="badge badge-pill badge-warning">${user.getLista_visite_da_prenotare().size()}</span>
				</a></li>
				<li class="nav-item"><a  onclick="loadingModal()" class="nav-link " href="./esamiPaziente.jsp"
					role="button" aria-haspopup="true" aria-expanded="false"> Esami
						<span class="badge badge-pill badge-warning">${user.lista_esami_prenotati.size() }</span>
				</a></li>
				<li class="nav-item d-inline-block align-bottom"><img
					alt="iconaUtente" class="img iconaUtente rounded-circle "
					src="${user.foto_path}"></li>
				<li class="nav-item"><a class="btn btn-danger" href="../login/login.jsp"><i class="fa fa-sign-out"></i> Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	&nbsp;
	
	<div class="container bg-faded"
		style="background-color: #C1D4D9; padding: 20px; border-radius: 20px; max-width: 50%;">
		<div class="container">
			<div class="media">
				<div class="media-body text-center" style="background-color:">
					<img class="rounded-circle " src="${user.foto_path}"
						width="150" height="150" alt="user">
					<h3 class="mt-0">Il tuo medico di base</h3>
					<div class="container"
						style="border-radius: 20px; background-color: #F2F2F2; padding-bottom: 10px; padding-top: 10px;">
						<h4>Nome medico: ${user.medico.nome} ${user.medico.cognome}</h4>
						<hr>
						<h4>Telefono: ${user.medico.telefono_studio}</h4>
						<hr>
						<h5>Per prenotare una visita vai alla pagine del medico di base: </h5>
						<a class="btn btn-success" href="../paziente/medicoBasePaziente.jsp"><i class="fa fa-user-md"></i> Vai al medico di base</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	&nbsp;
	<hr>
	<link rel="stylesheet" href="../css/normalize.min.css">
	<div class="container text-center">
		<div class="card">
			<div class="card-img">
				<img src="../images/pills.jpg" alt="pills" style="height: 220px;">
				<div class="overlay">
					<div class="overlay-content">
						<a onclick="loadingModal()" href="../paziente/ricettePaziente.jsp">Vai alle ricette</a>
					</div>
				</div>
			</div>
			<div class="card-content">
				<a onclick="loadingModal()" href="../paziente/ricettePaziente.jsp">
					<h2>Ricette</h2>
					<p>Le tue prescrizioni</p>
				</a>
			</div>
		</div>
		<div class="card">
			<div class="card-img">
				<img src="../images/visit.jpg" alt="pills" style="height: 220px;">
				<div class="overlay">
					<div class="overlay-content">
						<a onclick="loadingModal()" href="../paziente/visitePaziente.jsp">Vai alle visite</a>
					</div>
				</div>
			</div>
			<div class="card-content">
				<a onclick="loadingModal()" href="../paziente/visitePaziente.jsp">
					<h2>Visite</h2>
					<p>Tutte le tue visite</p>
				</a>
			</div>
		</div>
		<div class="card">
			<div class="card-img">
				<img src="../images/exam.jpg" alt="pills" style="height: 220px;">
				<div class="overlay">
					<div class="overlay-content">
						<a onclick="loadingModal()" href="../paziente/esamiPaziente.jsp">Vai agli esami</a>
					</div>
				</div>
			</div>
			<div class="card-content">
				<a onclick="loadingModal()" href="../paziente/esamiPaziente.jsp">
					<h2>Esami</h2>
					<p>I tuoi esami</p>
				</a>
			</div>
		</div>
	</div>
	&nbsp;
	
	<div class="modal fade" id="loading_modal" style="border-radius:20px;">
  <div class="modal-dialog" role="document" >
    <div class="modal-content">
     
      <div class="modal-body text-center">
        
		<div class="spinner-border text-info" role="status">
 			 
		</div>
		<h5><span>Caricamento...</span></h5>
      </div>
     
    </div>
  </div>
  </div>

  <script type="text/javascript">

  function loadingModal() {
  
$('#loading_modal').modal({
    backdrop: 'static',
    keyboard: false
})


  
  }
  
</script>
	
	
	

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<!-- robba -->
	<script type="text/javascript" id="rendered-js"
		src="../js/card_hover.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->

	<script type="text/javascript" src="../js/popper.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<footer class="text-center text-light">©2019 Oradini &
		Bertamini</footer>
</body>
</html>
