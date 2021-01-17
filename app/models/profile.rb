class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :titulo, use: :slugged
  belongs_to :user
  validates :user_id, uniqueness: true
  has_many :comments, :dependent => :destroy
  #cloudinary
  has_one_attached :avatar


end
