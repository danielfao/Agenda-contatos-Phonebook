package br.com.condlink

class Contato {

    String nome
    String apelido
    String endereco
    String email
    static hasMany = [telefones:Telefone]
    static belongsTo = [usuario:Usuario]

    static constraints = {
        nome (nullable: false, blank: false, unique: true, maxSize: 128)
        apelido (nullable: false, blank: false, unique: true, maxSize: 15)
        endereco (maxSize: 200)
        email (email: true)
    }

    String toString(){
        "$nome-($apelido)"
    }


}
