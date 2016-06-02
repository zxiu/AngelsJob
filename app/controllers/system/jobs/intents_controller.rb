class System::Jobs::IntentsController < System::JobsController
  before_action :set_intent, only: [:show, :edit, :update, :destroy]

  def index
    @intents = current_user.intents
  end

  # GET /intents/new
  def new
    @intent = Intent.new
  end

  # POST /intents
  # POST /intents.json
  def create
    @intent = Intent.new(intent_params)
    respond_to do |format|
      if @intent.save
        current_user.intents << @intent
        format.html { redirect_to action: :index, notice: 'Personal info was successfully created.' }
        format.json { render :show, status: :created, location: @intent }
      else
        format.html { render :new }
        format.json { render json: @intent.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      @intent.keywords = params.require(:intent)[:keywords].split(",").map(&:strip)
      if @intent.update(intent_params)
        format.html { redirect_to action: :index, notice: 'intent was successfully updated.' }
        format.json { render :show, status: :ok, location: @intent }
      else
        format.html { render :edit }
        format.json { render json: @intent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intents/1
  # DELETE /intents/1.json
  def destroy
    @intent.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intent
      @intent = current_user.intents.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intent_params
      params.require(:intent).permit(:branch, :job_type, :suspend, :postal_code, :distance)
    end
end
