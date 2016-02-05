package br.com.condlink

class Telefone {

    String numero
    String ddd
    String tipo
    static belongsTo = [contato:Contato]

    static constraints = {
        tipo(inList: ['Celular','Casa','Trabalho'])
        ddd(nullable: false, blank: false, maxSize: 2)
        numero(nullable: false, blank: false, maxSize: 10)
    }

    String toString(){
        "(${ddd})-${numero}"
    }
}
