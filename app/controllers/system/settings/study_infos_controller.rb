class System::Settings::StudyInfosController < System::SettingsController
  before_action :set_personal_info, only: [:show, :update, :destroy]

  def index
    @study_infos = StudyInfo.all
  end

  # GET /personal_infos/new
  def new
    @study_infos = StudyInfo.new
  end

  def edit
    if current_user.study_infos.blank?
      current_user.study_infos = StudyInfo.create
    end
    @user = current_user
    @study_infos = current_user.study_infos
  end

  def update
    respond_to do |format|
      if @study_info.update(personal_info_params)
        format.html { render :edit, notice: 'Study info was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_info }
      else
        format.html { render :edit }
        format.json { render json: @study_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_infos/1
  # DELETE /study_infos/1.json
  def destroy
    @study_info.destroy
    respond_to do |format|
      format.html { redirect_to study_infos_url, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_info
      puts(params.require(:study_info))
      @study_info = StudyInfo.find(params.require(:study_info)[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_info_params
      params.require(:study_info).permit(:first_name, :last_name, :tel, :mobile, :birthday, :gender)
    end

end
