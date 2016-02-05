<%@ page import="br.com.condlink.Telefone" %>



<div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="telefone.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${telefoneInstance.constraints.tipo.inList}" required="" value="${telefoneInstance?.tipo}" valueMessagePrefix="telefone.tipo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'ddd', 'error')} required">
	<label for="ddd">
		<g:message code="telefone.ddd.label" default="Ddd" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ddd" maxlength="2" required="" value="${telefoneInstance?.ddd}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="telefone.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numero" maxlength="10" required="" value="${telefoneInstance?.numero}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'contato', 'error')} required">
	<label for="contato">
		<g:message code="telefone.contato.label" default="Contato" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contato" name="contato.id" from="${br.com.condlink.Contato.list()}" optionKey="id" required="" value="${telefoneInstance?.contato?.id}" class="many-to-one"/>

</div>

