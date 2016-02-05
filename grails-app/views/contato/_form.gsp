<%@ page import="br.com.condlink.Contato" %>



<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="contato.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="128" required="" value="${contatoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'apelido', 'error')} required">
	<label for="apelido">
		<g:message code="contato.apelido.label" default="Apelido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apelido" maxlength="15" required="" value="${contatoInstance?.apelido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="contato.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endereco" maxlength="200" required="" value="${contatoInstance?.endereco}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="contato.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${contatoInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'telefones', 'error')} ">
	<label for="telefones">
		<g:message code="contato.telefones.label" default="Telefones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contatoInstance?.telefones?}" var="t">
    <li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefone" action="create" params="['contato.id': contatoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefone.label', default: 'Telefone')])}</g:link>
</li>
</ul>


</div>




