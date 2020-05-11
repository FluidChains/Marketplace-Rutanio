class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:edit,:create]

  # GET /services
  # GET /services.json
  def index
    @services = current_user.services
    @requests = current_user.requests
  end

  # GET /services/1
  # GET /services/1.json
  def show    
    @request = Request.new
    @requests = Request.all
    @skills = Skill.all
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
      @skills = Skill.all
  end

  # POST /services
  # POST /services.json
  def create
    @service = current_user.services.new(service_params)
    @service.categories = params[:categories]
    @service.skills = params[:skills]

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def service_params
       params.require(:service).permit(:name, :information,  :precio, :valid_until, :aditional_info, :user_id, :lenguaje, :exos_amount, :mail_servicio, :horas, :wpp, :web, :color , :currency_sugest)
    end
end
