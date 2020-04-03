<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Usuário</title>
	
	<style>
		.error {
			color: red;
			font-weight: bold;
		}
	</style>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
	<script src="http://digitalbush.com/files/jquery/maskedinput/rc3/jquery.maskedinput.js" type="text/javascript"></script>
	<script>
		jQuery(function($){
		   $(".datas").mask("99/99/9999");
		   $("#cpf").mask("999.999.999-99");
		});
	</script>
	

</head>
<body>
	<h1>Cadastro de Usuários</h1>
	
	<s:form action="${pageContext.request.contextPath }/salvar"
		method="post" modelAttribute="usuario_form">
		<table>
			<tr>
				<td><label id="usuario_nome" for="nome">Nome</label></td>

				<td>
					<s:input path="nome" id="nome" itemLabel="nome" pattern="[A-Za-z\s]+" /> 
				</td>
				<td>
					<s:errors path="nome" cssClass="error" />
				</td>	
			</tr>
			<tr>
				<td><label id="usuario_cpf" for="cpf">CPF</label></td>

				<td>
					<s:input path="cpf" id="cpf" itemLabel="cpf" /> 
				</td>
				<td>
					<s:errors path="cpf" cssClass="error" />
				</td>
			</tr>
			
			<tr>
            	<td><label id="usuario_data_nascimento" for=dataNascimento>Data de Nascimento</label></td>
              	<td>
              		<s:input path="dataNascimento" name="dataNascimento" id="dataNascimento" class="datas" value=" " />
              	</td>
              	<td>
					<s:errors path="dataNascimento" cssClass="error" />
					<c:if test="${not empty mensagemData}">
						<s:label path="dataNascimento" cssClass="error">${mensagemData}</s:label>
					</c:if>
				</td>
            </tr>
			<tr>
				<td></td>
				<td align="right"><input type="submit" value="Salvar" /></td>
			</tr>

		</table>
	</s:form>

	
</body>
</html>