require 'rest_client'
class System::Cvs::CareerInfosController < System::CvsController
  before_action :set_career_info, only: [:show, :edit, :update, :destroy]

  def index
    @career_infos = current_user.career_infos.order("#{:begin} DESC, #{:end} DESC")
    # send_simple_message
  end

  def send_simple_message
    puts("send_simple_message")
    RestClient.post "https://api:key-f2afa1e9b1bfec21fb43f43dfbbadf21@api.mailgun.net/v3/sandbox18aac9bcc8a849a1b3e42c4e578dfa75.mailgun.org/messages",
    :from => "Mailgun Sandbox <postmaster@sandbox18aac9bcc8a849a1b3e42c4e578dfa75.mailgun.org>",
    :to => "Zhuo Xiu <xiuzhuo@outlook.com>",
    :subject => "Hello Zhuo Xiu",
    :text => "Congratulations Zhuo Xiu, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
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
