class System::Jobs::OffersController < System::JobsController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = current_user.offers
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.company = Company.new(company_params)
    @offer.contact = Contact.new(contact_params)
    @offer.agent = Agent.find_by(agent_params)

    respond_to do |format|
      if @offer.save
        current_user.offers << @offer
        format.html { redirect_to action: :index, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @offer.update(offer_params) && @offer.company.update(company_params) && @offer.contact.update(contact_params)
        @offer.agent = Agent.find_by(agent_params)
        @offer.save
        format.html { redirect_to action: :index, notice: 'offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = current_user.offers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:title, :link, :position, :online_at)
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
