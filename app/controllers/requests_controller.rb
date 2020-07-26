class RequestsController < ApplicationController
  before_action :set_request, only: [:show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:edit,:create,:update, :destro]

  # GET /requests
  # GET /requests.json
  def index
    @requests = current_user.requests
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.new
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @service = Service.find(params[:service_id])
    @request = @service.requests.new(request_params)
    @request.user_id = current_user.id

    respond_to do |format|
      if @request.save
        UserNotifierMailer.send_signup_email(@request).deliver
        format.html { redirect_to welcome_postulaciones_path, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request.service}
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request.service, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @service = Service.find(params[:service_id])
    @request = @service.requests.find(params[:id])
    @request.destroy
    respond_to do |format|
      format.html { redirect_to @request.service, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:service_id])
    end

    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:mensaje, :contacto_mail, :user_id, :service_id)
    end
end
