class Service < ApplicationRecord
  include AASM
  belongs_to :user

  has_many :has_categories, :dependent => :destroy
  has_many :categories, through: :has_categories, :dependent => :destroy
  has_many :has_skills
  has_many :skills, through: :has_skills

  has_many  :requests, :dependent => :destroy
  after_create :save_categories
  validate :valide_categories
  after_create :save_skills
  validate :valide_skills
  validates :name, :information,  :precio, :valid_until,  :mail_servicio, :horas , :currency_sugest,  presence: true, length: {minimum: 2, too_short: "Minimo son %{count} caracteres." }

  def categories=(value)
    @categories = value
  end
  def getCategories
    @categories
  end
  def skills=(value)
    @skills = value
  end
  def getSkills
    @skills
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

  def save_skills
  	@skills.each do |skill_id|
  		HasSkill.create(skill_id: skill_id, service_id: self.id)
  	end
  end
  def valide_skills
  	if self.getSkills.blank? && self.id.nil?
  		errors.add(:skills, "Debe agregar una Skills.")
  	end
  end



end
