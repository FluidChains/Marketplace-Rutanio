class Skill < ApplicationRecord
  has_many :has_skills
  has_many :services, through: :has_skills
  validates :name,  presence: true, length: {minimum: 2, too_short: "Minimo son %{count} caracteres." , maximum: 200 }
end
