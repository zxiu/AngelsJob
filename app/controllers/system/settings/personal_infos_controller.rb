class System::Settings::PersonalInfosController < System::SettingsController
  before_action :set_personal_info, only: [:show, :update, :destroy]
  def show
  end

  def edit
    if current_user.personal_info.blank?
      current_user.personal_info = PersonalInfo.create
      current_user.personal_info.email = current_user.email
    end
    @user = current_user
    @personal_info = current_user.personal_info
  end

  def update
    respond_to do |format|
      if @personal_info.update(personal_info_params)
        format.html { render :edit, notice: 'Personal info was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_info }
      else
        format.html { render :edit }
        format.json { render json: @personal_info.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_info
      puts(params.require(:personal_info))
      @personal_info = PersonalInfo.find(params.require(:personal_info)[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_info_params
      params.require(:personal_info).permit(:first_name, :last_name, :tel, :mobile, :birthday, :gender)
    end

end
