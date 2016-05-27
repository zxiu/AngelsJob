class TadminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end

  def index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @agent = Agent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:agent).permit(:name, :level, :catalog, {assets: []})
    end

end
