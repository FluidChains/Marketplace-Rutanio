class WelcomeController < ApplicationController

  def index
    @services = Service.publicados.paginate(:page => params[:page], :per_page => 24)
    @serv = @services.sort_by { rand }
    @service = Service.new
    @categories = Category.all
    @skills = Skill.all
  end
  def search
    @skills = Skill.all
    @services = Service.publicados.where("name LIKE :query", query: "%#{params[:find]}%")

  end
  def vencido
    @services = Service.vencidos.paginate(:page => params[:page], :per_page => 24)
    @service = Service.new
    @categories = Category.all
    @skills = Skill.all
  end
  def panel
    @skills = Skill.all
  end

  def postulaciones
    @requests = current_user.requests
  end

end
