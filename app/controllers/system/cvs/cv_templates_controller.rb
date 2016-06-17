class System::Cvs::CvTemplatesController < System::CvsController
  before_action :set_cv_template, only: [:show, :edit, :update, :destroy]

  def index
    @cv_templates = current_user.cv_templates
  end

  # GET /cv_templates/new
  def new
    @cv_template = CvTemplate.new
  end

  # POST /cv_templates
  # POST /cv_templates.json
  def create
    @cv_template = CvTemplate.new(cv_template_params)
    respond_to do |format|
      if @cv_template.save
        current_user.cv_templates << @cv_template
        format.html { redirect_to action: :index, notice: 'Personal info was successfully created.' }
        format.json { render :show, status: :created, location: @cv_template }
      else
        format.html { render :new }
        format.json { render json: @cv_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @cv_template.update(cv_template_params)
        format.html { redirect_to action: :index, notice: 'Education info was successfully updated.' }
        format.json { render :show, status: :ok, location: @cv_template }
      else
        format.html { render :edit }
        format.json { render json: @cv_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cv_templates/1
  # DELETE /cv_templates/1.json
  def destroy
    @cv_template.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: 'Personal info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cv_template
      @cv_template = current_user.cv_templates.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cv_template_params
      params.require(:cv_template).permit(:name, :content, :for)
    end

end
