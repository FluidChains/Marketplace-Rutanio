class RequestsMailer < ApplicationMailer

  def formulariorequest(contacto)
    @contacto = contacto.mensaje
    @greeting = "Felicidades  #{contacto.user.email} te postulaste con exito a la publicacion de #{contacto.service.mail_servicio}"

      @recipients =   contacto.service.mail_servicio
      emails = @recipients
      mail(:to => emails, :subject => "A replacement clerk has been requested #{@greeting} ")


  end

end
