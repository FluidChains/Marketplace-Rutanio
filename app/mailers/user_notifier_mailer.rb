class UserNotifierMailer < ApplicationMailer
  default :from => 'social@rutanio.com '

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(contacto)
    @contacto = contacto.mensaje
    @greeting = "Felicidades  #{contacto.user.email} se postulo con exito a la publicacion de #{contacto.service.mail_servicio}"
      @recipients =  "  #{contacto.user.email}, #{contacto.service.mail_servicio}"
      emails = @recipients
      mail(:to => emails, :subject => "Notificacion Rutanio Marketplace")
  end
end
