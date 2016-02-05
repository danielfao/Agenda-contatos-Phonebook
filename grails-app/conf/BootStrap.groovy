import br.com.condlink.Permissao;
import br.com.condlink.Usuario;
import br.com.condlink.UsuarioPermissao;

class BootStrap {

    def init = { servletContext ->

        Permissao admin = Permissao.findByAuthority("ROLE_ADMIN")
        if (admin == null){
            admin = new Permissao(authority: "ROLE_ADMIN").save(flush: true)
        }

        Permissao comum = Permissao.findByAuthority("ROLE_COMUM")
        if (comum == null){
            comum = new Permissao(authority: "ROLE_COMUM").save(flush: true)
        }

        Usuario administrador = Usuario.findByUsername("administrador")
        if (administrador == null){
            administrador = new Usuario(username: "administrador", password: "123", enabled: true,
                    accountExpired: false, accountLocked: false, passwordExpired: false).save(flush: true)
        }

        Usuario daniel = Usuario.findByUsername("daniel")
        if (daniel == null){
            daniel = new Usuario(username: "daniel", password: "123", enabled: true,
                    accountExpired: false, accountLocked: false, passwordExpired: false).save(flush: true)
        }

        if(UsuarioPermissao.findByUsuarioAndPermissao(administrador, admin) == null){
           new UsuarioPermissao(usuario: administrador, permissao: admin).save(flush: true)
        }

        if(UsuarioPermissao.findByUsuarioAndPermissao(daniel, comum) == null){
            new UsuarioPermissao(usuario: daniel, permissao: comum).save(flush: true)
        }

    }
    def destroy = {
    }
}
