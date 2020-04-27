class WelcomeController < ApplicationController
  def index
    @services = Service.paginate(:page => params[:page], :per_page => 24)
    @service = Service.new
  end
end
