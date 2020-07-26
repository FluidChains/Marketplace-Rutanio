class UserNotifierMailer < ApplicationMailer
  default :from => 'rutanio.confirmation@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(contacto)
    @contacto = contacto.mensaje
    @greeting = "Felicidades  #{contacto.user.email} te postulaste con exito a la publicacion de #{contacto.service.mail_servicio}"

      @recipients =   contacto.service.mail_servicio
      emails = @recipients
      mail(:to => emails, :subject => "A replacement clerk has been requested #{@greeting} ")

  end
end
