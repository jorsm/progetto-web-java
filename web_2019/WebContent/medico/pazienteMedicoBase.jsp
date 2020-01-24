<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html5>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Paziente</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/card_hover.css">
<link rel="stylesheet" href="../css/normalize.min.css">
<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">Nome Cognome</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"> <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item active"> <a class="nav-link " href="#"  role="button"  aria-haspopup="true" aria-expanded="false"> Pazienti </a> </li>
      <li class="nav-item"><a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Visite <span class="badge badge-pill badge-warning">2</span></a> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="../images/utente1img.jpg"></li>
      <li class="nav-item"> <a class="btn btn-danger  " href="#">Logout</a> </li>
    </ul>
  </div>
</nav>
&nbsp;
<div class="container bg-faded" style="background-color: #C1D4D9; padding:20px; border-radius: 20px;">
  <div class="container">
    <div class="media">
      <div class="media-body text-center" style="background-color:  "> <img class="rounded-circle " src="../images/utente1img.jpg" width="150" height="150" alt="user">
        <h3 class="mt-0">${visita_corrente.paziente.nome} ${visita_corrente.paziente.cognome}</h3>
        &nbsp;
        <div class="container bg-light" style="border-radius: 20px; padding-bottom: 10px; padding-top: 10px;">
          <h5>Codice fiscale: ${visita_corrente.paziente.codice_fiscale}</h5>
          <hr>
          <h5>Luogo di nascita: ${visita_corrente.paziente.luogo_nascita}</h5>
          <hr>
          <h5>Data di nascita: ${visita_corrente.paziente.data_nascita}</h5>
        </div>
      </div>
    </div>
  </div>
</div>
&nbsp;
<hr>
<div class="container text-center">
  <div class="card">
    <div class="card-img"> <img src="../images/pills.jpg" alt="pills" style="height:220px;">
      <div class="overlay">
      <form id="formRicette" action="RicettePaziente"> 
      <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
        <div class="overlay-content"><a class="hover" onclick="formRicette.submit();">Vai alle ricette del paziente</a></div>
        </form>
      </div>
    </div>
    <div class="card-content"> <a href="#!">
      <h2>Ricette</h2>
      <p>Le prescrizioni fatte al paziente</p>
      </a> </div>
  </div>
  <div class="card">
    <div class="card-img"> <img src="../images/visit.jpg" alt="pills" style="height:220px;">
      <div class="overlay">
      <form id="formVisite" action="VisitePaziente">  
       <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
        <div class="overlay-content"><a class="hover" onclick="formVisite.submit();">Vai alle visite del paziente</a></div>
        </form>
      </div>
    </div>
    <div class="card-content"> <a href="#!">
      <h2>Visite</h2>
      <p>Le visite effettuate dal paziente</p>
      </a> </div>
  </div>
  <div class="card">
    <div class="card-img"> <img src="../images/exam.jpg" alt="pills" style="height:220px;">
      <div class="overlay">
        <div class="overlay-content"><a href="#!">Vai agli esami del paziente</a></div>
      </div>
    </div>
    <div class="card-content"> <a href="#!">
      <h2>Esami</h2>
      <p>Gli esami fatti dal paziente</p>
      </a> </div>
  </div>
</div>
<hr>
<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
<script src="../js/card_hover.js"></script>
</body>
</html>