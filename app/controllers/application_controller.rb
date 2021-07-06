class ApplicationController < ActionController::Base
  before_action :configuraciones
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :panel




  def configuraciones
    @categories = Category.all
  end

  def panel
    @skills = Skill.all
  end


  def authenticate_admin!
    redirect_to root_path, notice: "No tienes permiso para esta acción. " unless user_signed_in? && current_user.is_admin?
  end

  protected


    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email,:password, :password_confirmation, :company, :name, :last_name,:mail, :permission_level, :web_site, :skill,:lenguage, :discord_user,:wpp)
    	end
      devise_parameter_sanitizer.permit(:account_update, keys: [:email,:password, :password_confirmation, :company, :name, :last_name,:mail, :permission_level, :web_site, :skill,:lenguage, :discord_user,:wpp])
    end


end
