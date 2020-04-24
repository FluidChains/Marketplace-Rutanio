class ApplicationController < ActionController::Base
  before_action :configuraciones
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configuraciones
    @categories = Category.all
  end



  protected


    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email,:password, :password_confirmation, :company, :name, :last_name,:mail, :permission_level, :web_site, :skill,:lenguage, :discord_user,:wpp)
    	end
      devise_parameter_sanitizer.permit(:account_update, keys: [:email,:password, :password_confirmation, :company, :name, :last_name,:mail, :permission_level, :web_site, :skill,:lenguage, :discord_user,:wpp])
    end


end
