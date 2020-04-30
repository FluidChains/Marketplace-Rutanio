class Category < ApplicationRecord
has_many :has_categories, :dependent => :destroy
has_many :services, through: :has_categories, :dependent => :destroy

validates :nombre_categoria,:color ,  presence: true, length: {minimum: 3, too_short: "Minimo son %{count} caracteres." }
validates :description, presence: true, length: {minimum: 5, too_short: "Minimo son %{count} caracteres." }

end
