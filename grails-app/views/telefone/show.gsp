
<%@ page import="br.com.condlink.Telefone" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefone.label', default: 'Telefone')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-telefone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-telefone" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list telefone">
			
				<g:if test="${telefoneInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="telefone.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${telefoneInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefoneInstance?.ddd}">
				<li class="fieldcontain">
					<span id="ddd-label" class="property-label"><g:message code="telefone.ddd.label" default="Ddd" /></span>
					
						<span class="property-value" aria-labelledby="ddd-label"><g:fieldValue bean="${telefoneInstance}" field="ddd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefoneInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="telefone.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${telefoneInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefoneInstance?.contato}">
				<li class="fieldcontain">
					<span id="contato-label" class="property-label"><g:message code="telefone.contato.label" default="Contato" /></span>
					
						<span class="property-value" aria-labelledby="contato-label"><g:link controller="contato" action="show" id="${telefoneInstance?.contato?.id}">${telefoneInstance?.contato?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:telefoneInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${telefoneInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
