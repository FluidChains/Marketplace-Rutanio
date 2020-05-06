class Request < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :mensaje,:contacto_mail ,  presence: true, length: {minimum: 3, too_short: "Minimo son %{count} caracteres." , maximum: 900 }
  
end
