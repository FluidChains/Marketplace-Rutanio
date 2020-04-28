class Service < ApplicationRecord
  include AASM
  belongs_to :user

  has_many :has_categories, :dependent => :destroy
  has_many :categories, through: :has_categories, :dependent => :destroy
  has_many  :requests, :dependent => :destroy
  after_create :save_categories
  validate :valide_categories

  def categories=(value)
    @categories = value
  end
  def getCategories
    @categories
  end


  private

  def save_categories
  	@categories.each do |category_id|
  		HasCategory.create(category_id: category_id, service_id: self.id)
  	end
  end
  def valide_categories
  	if self.getCategories.blank? && self.id.nil?
  		errors.add(:categories, "Debe agregar una categoria.")
  	end
  end



end
