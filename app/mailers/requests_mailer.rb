class RequestsMailer < ApplicationMailer

  def formulariorequest(contacto)
    @contacto = contacto.mensaje
    @greeting = "Hola  #{contacto.contacto_mail}"
    mail(to: contacto.contacto_mail,
      subject: "Acabas de aplicar con exito")

  end

end
