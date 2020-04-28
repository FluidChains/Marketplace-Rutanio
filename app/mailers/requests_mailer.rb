class RequestsMailer < ApplicationMailer

  def formulariorequest(contacto)
    @contacto = contacto.mensaje
    @greeting = "hi #{contacto.contacto_mail}"
    mail(to: "soy@companiax.com",
      subject: "Please see the Terms and Conditions attached")

  end

end
