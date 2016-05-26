class System::Cvs::EducationInfosController < System::CvsController
  before_action :set_education_info, only: [:show, :edit, :update, :destroy]

  def index
    @education_infos = current_user.education_infos.order("#{:begin}, #{:end}")
  end

  # GET /education_infos/new
  def new
    @education_info = EducationInfo.new
  end

  # POST /education_infos
  # POST /education_infos.json
  def create
    @education_info = EducationInfo.new(education_info_params)
    respond_to do |format|
      if @education_info.save
        current_user.education_infos << @education_info
        format.html { redirect_to action: :index, notice: 'Personal info was successfully created.' }
        format.json { render :show, status: :created, location: @education_info }
      else
        format.html { render :new }
        format.json { render json: @education_info.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @education_info.update(education_info_params)
        format.html { redirect_to action: :index, notice: 'education info was successfully updated.' }
        format.json { render :show, status: :ok, location: @education_info }
      else
        format.html { render :edit }
        format.json { render json: @education_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /education_infos/1
  # DELETE /education_infos/1.json
  def destroy
    @education_info.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education_info
      @education_info = current_user.education_infos.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_info_params
      params.require(:education_info).permit(:insititude, :subject, :begin, :end, :graduation, :score, {assets: []})
    end

end
