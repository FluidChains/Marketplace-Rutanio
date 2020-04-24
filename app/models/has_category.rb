class HasCategory < ApplicationRecord
  belongs_to :service, :dependent => :destroy
  belongs_to :category
end
