class System::Settings::PersonalInfosController < System::SettingsController
  before_action :current_user_personal_info, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @personal_info.update(personal_info_params)
      redirect_to @personal_info, notice: 'Personal info was successfully updated.'
    else
      render :show
    end
  end

  private
    def current_user_personal_info
      if current_user.personal_info.blank?
        current_user.personal_info = PersonalInfo.create
        current_user.personal_info.email = current_user.email
      end
      @personal_info = current_user.personal_info
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_info_params
      params.require(:personal_info).permit(:first_name, :last_name, :tel, :mobile, :birthday, :gender)
    end

end
