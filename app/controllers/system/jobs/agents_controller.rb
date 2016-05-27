class System::Jobs::AgentsController < System::JobsController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  def index
    @agents = Agent.all
  end

  # GET /agents/new
  def new
    @agent = Agent.new
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new(agent_params)
    respond_to do |format|
      if @agent.save
        current_user.agents << @agent
        format.html { redirect_to action: :index, notice: 'Personal info was successfully created.' }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    if params[:checked].blank?
      current_user.agents.delete(@agent)
    else
      current_user.agents << @agent
    end
    redirect_to action: :index
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params.require(:agent).permit(:name, :domain, :logo, :locate)
    end

end
