class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy, :unpublish, :publish]
  before_action :authenticate_user!, only:[:edit,:create]

  # GET /services
  # GET /services.json
  def index
    @services = current_user.services

    if user_signed_in? && current_user.is_admin? && !params.has_key?(:normal)
        @users = User.all
        @services = Service.all.paginate(:page => params[:page], :per_page => 12)
        render  :"admin_service"
    end
  end


  # GET /services/1
  # GET /services/1.json
  def show
    @request = Request.new
    @requests = @service.requests.paginate(:page => params[:page], :per_page => 1)
    @skills = Skill.paginate(:page => params[:page], :per_page => 3)
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

  def publish
    @service.publish!
    redirect_to @service
  end

  def unpublish
    @service.unpublish!
    redirect_to @service
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
       params.require(:service).permit(:name, :information,  :precio, :valid_until, :aditional_info, :user_id, :lenguaje, :exos_amount, :mail_servicio, :horas, :wpp, :web, :color , :currency_sugest , :image_serv)
    end
end
