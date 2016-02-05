
<%@ page import="br.com.condlink.Contato" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contato.label', default: 'Contato')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contato" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contato" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contato">
			
				<g:if test="${contatoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="contato.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${contatoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.apelido}">
				<li class="fieldcontain">
					<span id="apelido-label" class="property-label"><g:message code="contato.apelido.label" default="Apelido" /></span>
					
						<span class="property-value" aria-labelledby="apelido-label"><g:fieldValue bean="${contatoInstance}" field="apelido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="contato.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${contatoInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="contato.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${contatoInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.telefones}">
				<li class="fieldcontain">
					<span id="telefones-label" class="property-label"><g:message code="contato.telefones.label" default="Telefones" /></span>
					
						<g:each in="${contatoInstance.telefones}" var="t">
						<span class="property-value" aria-labelledby="telefones-label"><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="contato.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${contatoInstance?.usuario?.id}">${contatoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:contatoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${contatoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
