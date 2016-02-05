package br.com.condlink

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
//Outra maneira de dar permissão
@Secured(["ROLE_ADMIN","ROLE_COMUM"])
class ContatoController {

    //injetando spring security service para ter acesso ao métodos do springSecurity plugin

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def usuario = springSecurityService.getCurrentUser() //pegando usuário ativo
        def contatos = Contato.findAllByUsuario(usuario,[params]) //mostrando apenas o conteúdo do mesmo

        //retornando contatos para a view
        respond contatos, model:[contatoInstanceCount: contatos.size()]
    }

    def show(Contato contatoInstance) {
        respond contatoInstance
    }

    def create() {
        respond new Contato(params)
    }

    @Transactional
    def save() {
        // pPassando paramas no new. Assim ele faz o Bind automático dos dados que vem da view para o objeto.
        // Exemplo atributo nome ele coloca no mesmo atributo nome do objeto
        Contato contatoInstance = new Contato(params)

        // pega o usuario online (não esquecer de sempre injetar o springSecurity service)
        def usuario = springSecurityService.getCurrentUser()
        // adiciona no objeto o usuario
            contatoInstance.usuario = usuario

        if (contatoInstance == null) {
            notFound()
            return
        }

        if (contatoInstance.hasErrors()) {
            respond contatoInstance.errors, view:'create'
            return
        }

        contatoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contato.label', default: 'Contato'), contatoInstance.id])
                redirect contatoInstance
            }
            '*' { respond contatoInstance, [status: CREATED] }
        }
    }

    def edit(Contato contatoInstance) {
        respond contatoInstance
    }

    @Transactional
    def update(Contato contatoInstance) {
        if (contatoInstance == null) {
            notFound()
            return
        }

        if (contatoInstance.hasErrors()) {
            respond contatoInstance.errors, view:'edit'
            return
        }

        contatoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Contato.label', default: 'Contato'), contatoInstance.id])
                redirect contatoInstance
            }
            '*'{ respond contatoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Contato contatoInstance) {

        if (contatoInstance == null) {
            notFound()
            return
        }

        contatoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Contato.label', default: 'Contato'), contatoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contato.label', default: 'Contato'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
