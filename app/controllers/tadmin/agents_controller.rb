class Tadmin::AgentsController < TadminController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @agents = Agent.all
  end

  def new
    @agent = Agent.new
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new
    @agent.update(agent_params)
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
    respond_to do |format|
      if @agent.update(agent_params)
        format.html { redirect_to action: :index, notice: 'Agent info was successfully updated.' }
        format.json { render :show, status: :ok, location: @agent }
      else
        format.html { render :edit }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
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
      @agent = current_user.agents.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params.require(:agent).permit(:name, :homepage, :logo, :locate)
    end
end
