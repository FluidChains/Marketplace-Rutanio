class SearchController < ApplicationController
  def create
    palabra = "%#{params[:keyword]}%"
    @services = Service.publicados.where("name LIKE ? OR description LIKE ? ", palabra , palabra)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: @services }
      format.js
    end
  end
end
