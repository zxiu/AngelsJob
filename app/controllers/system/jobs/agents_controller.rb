class System::Jobs::AgentsController < System::JobsController
  before_action :set_agent, only: [:show, :edit, :update]

  def index
    @agents = Agent.all
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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end


end
