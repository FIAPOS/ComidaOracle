<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

<title>Comidas</title>

<!--LINK CSS E JS-->
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/img" var="img" />
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<link href="${css}/bootstrap.css" rel="stylesheet">
<link href="${css}/small-business.css" rel="stylesheet">

</head>

<body>

	<!--BARRA DO TOPO-->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<a href="${contextPath}/comida"><img src="${img}/logo.png" width="110px"></a>
			</div>
		</div>
	</nav>

	<!--TITULO-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Cardápio</h1>
				<p class="toolbar">
					<!--BOTÃO PARA ADICIONAR UMA NOVA COMIDA-->
					<a class="create btn btn-default"
						href="${contextPath}/comida/cardapio/form?page=comida-novo">Adicionar
						comida</a> <span class="alert"></span>
				</p>
				<br>
				<c:if test="${not empty messages}">
					<h3 class="alert alert-warning">${messages}</h3>
				</c:if>

				<!--CARD BOOTSTRAP PARA APRE. DOS ELEMENTOS. LAÇO FOREACH-->
				<c:forEach items="${comidas}" var="comida">
					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">${comida.nome}</h5>
							<h6 class="card-subtitle mb-2 text-muted">R$ ${comida.preco}</h6>
							<form:form action="${contextPath}/comida/cardapio/${comida.id}"
								method="delete">
								<a class="btn btn-primary btn-xs"
									href="${contextPath}/comida/cardapio/${comida.id}">Detalhes</a>
								<a class="btn btn-warning btn-xs"
									href="${contextPath}/comida/cardapio/form?page=comida-editar&id=${comida.id}">Editar</a>
								<input type="submit" value="Excluir"
									class="btn btn-warning btn-xs">
							</form:form>
						</div>
					</div>
					<hr style="border-color: #A5A5A5;">
				</c:forEach>
			</div>
		</div>
		<hr>
	</div>


	<!--SCRIPT-->
	<script src="${js}/jquery.js"></script>
	<script src="${js}/bootstrap.min.js"></script>

</body>
</html>