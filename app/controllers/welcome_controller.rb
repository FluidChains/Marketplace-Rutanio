class WelcomeController < ApplicationController
  before_action :athenticate_admin!, only:[:administrador]

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
    @serv = @services.sort_by { rand }

  end
  def vencido
    @services = Service.vencidos.paginate(:page => params[:page], :per_page => 24)
    @serv = @services.sort_by { rand }
    @service = Service.new
    @categories = Category.all
    @skills = Skill.all
  end
  def perfil
    @requests = current_user.requests
    @services = current_user.services
  end

  def postulaciones
    @requests = current_user.requests
  end

end
