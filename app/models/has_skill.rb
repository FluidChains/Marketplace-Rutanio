class HasSkill < ApplicationRecord
  belongs_to :service
  belongs_to :skill
end
