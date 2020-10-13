class RequestsMailer < ApplicationMailer
  default :from => "social@rutanio.com"

  def formulariorequest(contacto)
    @contacto = contacto.mensaje
    @greeting = "Felicidades  #{contacto.user.email} se postulo con exito a la publicacion de #{contacto.service.mail_servicio}, visita tu perfil del marketplace y sigue creando nuevas alianzas"
    @recipients =   contacto.service.mail_servicio
    emails = @recipients
    mail(:to => emails, :subject => " #{@greeting} ")


  end

end
