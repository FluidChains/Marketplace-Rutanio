class User < ApplicationRecord
  include PermissionsConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :services, dependent: :destroy
  has_many  :requests
  has_many  :profiles
end
