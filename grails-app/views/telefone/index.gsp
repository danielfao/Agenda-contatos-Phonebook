
<%@ page import="br.com.condlink.Telefone" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefone.label', default: 'Telefone')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-telefone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-telefone" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="tipo" title="${message(code: 'telefone.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="ddd" title="${message(code: 'telefone.ddd.label', default: 'Ddd')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'telefone.numero.label', default: 'Numero')}" />
					
						<th><g:message code="telefone.contato.label" default="Contato" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${telefoneInstanceList}" status="i" var="telefoneInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${telefoneInstance.id}">${fieldValue(bean: telefoneInstance, field: "tipo")}</g:link></td>
					
						<td>${fieldValue(bean: telefoneInstance, field: "ddd")}</td>
					
						<td>${fieldValue(bean: telefoneInstance, field: "numero")}</td>
					
						<td>${fieldValue(bean: telefoneInstance, field: "contato")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${telefoneInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
