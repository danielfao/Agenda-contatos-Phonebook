package br.com.condlink

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)

@Secured(["ROLE_ADMIN", "ROLE_COMUM"])
class TelefoneController {

    def springSecurityService
    def telefoneService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def usuario = springSecurityService.getCurrentUser() //pegando usuário
        //criou um service para pesquisa avançada e chamou na variavel telefone
        def telefones = telefoneService.buscaTelefoneDeContatosUsuario(usuario)
        params.max = Math.min(max ?: 10, 100)
        respond telefones, model:[telefoneInstanceCount: telefones.size()]
    }

    def show(Telefone telefoneInstance) {
        respond telefoneInstance
    }

    def create() {
       respond new Telefone(params)
    }

    @Transactional
    def save() {

        Telefone telefoneInstance = new Telefone(params)


        if (telefoneInstance == null) {
            notFound()
            return
        }

        if (telefoneInstance.hasErrors()) {
            respond telefoneInstance.errors, view:'create'
            return
        }

        telefoneInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'telefone.label', default: 'Telefone'), telefoneInstance.id])
                redirect telefoneInstance
            }
            '*' { respond telefoneInstance, [status: CREATED] }
        }
    }

    def edit(Telefone telefoneInstance) {
        respond telefoneInstance
    }

    @Transactional
    def update(Telefone telefoneInstance) {
        if (telefoneInstance == null) {
            notFound()
            return
        }

        if (telefoneInstance.hasErrors()) {
            respond telefoneInstance.errors, view:'edit'
            return
        }

        telefoneInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Telefone.label', default: 'Telefone'), telefoneInstance.id])
                redirect telefoneInstance
            }
            '*'{ respond telefoneInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Telefone telefoneInstance) {

        if (telefoneInstance == null) {
            notFound()
            return
        }

        telefoneInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Telefone.label', default: 'Telefone'), telefoneInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
