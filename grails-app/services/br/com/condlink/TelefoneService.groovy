package br.com.condlink

import grails.transaction.Transactional

@Transactional
class TelefoneService {
/* Entender como Funciona  > Criteria Grails < */

    def buscaTelefoneDeContatosUsuario(Usuario usuario) {
        def telefones = Telefone.createCriteria().list {
            contato {
                eq("usuario",usuario)
            }
        }
        return  telefones

    }
}
