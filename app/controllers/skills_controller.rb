class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:destroy, :create, :new,  :update,:index, :edit]

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.paginate(:page => params[:page], :per_page => 10)
    if user_signed_in? && current_user.is_admin? && !params.has_key?(:normal)
    @skills = Skill.paginate(:page => params[:page], :per_page => 10)
      render  :index
    end
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @services = @skill.services.publicados.paginate(:page => params[:page], :per_page => 12)
    @service = Service.new
    @skills = Skill.all
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skill_params
      params.require(:skill).permit(:name, :color_tag)
    end
end
