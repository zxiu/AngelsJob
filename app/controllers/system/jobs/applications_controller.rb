class System::Jobs::ApplicationsController < System::JobsController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  def index
    @applications = current_user.applications
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)
    @application.company = Company.new(company_params)
    @application.contact = Contact.new(contact_params)
    @application.agent = Agent.find_by(agent_params)

    respond_to do |format|
      if @application.save
        current_user.applications << @application
        format.html { redirect_to action: :index, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @application.update(application_params) && @application.company.update(company_params) && @application.contact.update(contact_params)
        @application.agent = Agent.find_by(agent_params)
        @application.save
        format.html { redirect_to action: :index, notice: 'application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = current_user.applications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:title, :link, :position, :online_at)
    end

    def agent_params
      params.require(:agent).permit(:id)
    end

    def company_params
      params.require(:company).permit(:name, :homepage)
    end

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :gender)
    end
end
