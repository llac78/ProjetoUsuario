<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Usuários</title>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
	

</head>
<body>
	<s:form action="${pageContext.request.contextPath }/inicio" method="get">
		<table>
			<tr>
				<td></td>
				<td align="right"><input type="submit" value="Página Inicial" /></td>
			</tr>
		</table>
	</s:form>
	
	<h1>Usuários</h1>
	
	<c:choose>
		<c:when test="${not empty listaUsuarios}">
			<table>
				<tr>
					<td><h3>Nome</h3></td>
					<td><h3>CPF</h3></td>
					<td><h3>Data de Nascimento</h3></td>
					
				</tr>

				<c:forEach var="usuario" items="${listaUsuarios}">
					<tr>
						<td>${usuario.nome}</td>
						<td>${usuario.cpf}</td>
						<td>${usuario.dataNascimento}</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h1>Não há usuários cadastrados.</h1>
		</c:otherwise>
	</c:choose>

	
</body>
</html>