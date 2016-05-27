class System::Cvs::SkillsController < System::CvsController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skills = current_user.skills.order(:catalog)
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)
    respond_to do |format|
      if @skill.save
        current_user.skills << @skill
        format.html { redirect_to action: :index, notice: 'Personal info was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to action: :index, notice: 'Education info was successfully updated.' }
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
      format.html { redirect_to action: :index, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = current_user.skills.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:name, :level, :catalog, {assets: []})
    end

end
