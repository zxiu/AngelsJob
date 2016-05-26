class System::Cvs::CareerInfosController < System::CvsController
  before_action :set_career_info, only: [:show, :edit, :update, :destroy]

  def index
    @career_infos = current_user.career_infos.order("#{:begin} DESC, #{:end} DESC")
  end

  # GET /career_infos/new
  def new
    @career_info = CareerInfo.new
  end

  # POST /career_infos
  # POST /career_infos.json
  def create
    @career_info = CareerInfo.new(career_info_params)
    respond_to do |format|
      if @career_info.save
        current_user.career_infos << @career_info
        format.html { redirect_to action: :index, notice: 'Personal info was successfully created.' }
        format.json { render :show, status: :created, location: @career_info }
      else
        format.html { render :new }
        format.json { render json: @career_info.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @career_info.update(career_info_params)
        format.html { redirect_to action: :index, notice: 'Education info was successfully updated.' }
        format.json { render :show, status: :ok, location: @career_info }
      else
        format.html { render :edit }
        format.json { render json: @career_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /career_infos/1
  # DELETE /career_infos/1.json
  def destroy
    @career_info.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career_info
      @career_info = current_user.career_infos.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_info_params
      params.require(:career_info).permit(:employer, :position, :begin, :end, :activity, {assets: []})
    end

end
