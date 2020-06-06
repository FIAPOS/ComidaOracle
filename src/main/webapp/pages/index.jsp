<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="pt">
<head>
<title>Restaurante3SIA</title>
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/img" var="img" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="${css}/estilo.css" rel="stylesheet">
</head>
<body>

	<!-- Barra de mensagem acima -->
	<div id="corona">
		<h4>Devido ao covid-19, o restaurante está fechado. Entregas
			online somente!</h4>
		<a href="https://covid.saude.gov.br/"><button type="button"
				class="btn btn-outline-light">Saiba Mais!</button></a>
	</div>

	<!-- Logomarca do restaurante -->
	<div id="background">
		<img src="${img}/logo.png" width="100px">
	</div>

	<!-- Botão com a rota para o crud-->
	<div id="botao">
		<a href="${contextPath}/comida/cardapio"><button type="button"
				class="btn btn-outline-light">Acessar</button></a>
	</div>

	<!-- footer card-->
	<div class="card" onclick="myFunction(this)">
		<div class="container">
			<br> Gustavo Duregger
			<hr>
			Murilo Melo
			<hr>
			Yan Alexandre
			<hr>
			<h6>Formas de Pagamento</h6>
			<img
				src="https://www.justatrama.com.br/wp-content/uploads/2018/11/Justa-Trama-Moda-em-Algod%C3%A3o-Org%C3%A2nico-Como-pagar-2.png"
				width="100%">
		</div>
		<br>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>