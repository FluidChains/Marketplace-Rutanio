class Skill < ApplicationRecord
  has_many :has_skills
  has_many :services, through: :has_skills
end
