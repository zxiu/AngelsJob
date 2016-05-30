class System::Cvs::PersonalInfosController < System::CvsController
  before_action :current_user_personal_info, only: [:index, :show, :edit, :update]

  def index
  end

  def show
    # UserMailer.welcome_mail(current_user).deliver_now
  end

  def edit
  end

  def update
    if @personal_info.update(personal_info_params) && @personal_info.address.update(address_params)
      redirect_to action: :index, notice: 'Personal info was successfully updated.'
    else
      render :index
    end
  end

  private
    def current_user_personal_info
      if current_user.personal_info.blank?
        current_user.personal_info = PersonalInfo.create
        current_user.personal_info.email = current_user.email
      end
      if current_user.personal_info.address.blank?
         current_user.personal_info.address = Address.new
      end
      @personal_info = current_user.personal_info
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_info_params
      params.require(:personal_info).permit(:first_name, :last_name, :email, :tel, :mobile, :birthday, :gender, :avatar, :remote_avatar_url)
    end

    def address_params
      params.require(:address).permit(:street, :house_no, :city, :postal_code, :country)
    end

end
