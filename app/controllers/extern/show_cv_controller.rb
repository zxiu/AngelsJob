class Extern::ShowCvController < ExternController


  def show
  end

  def what
    @what = params[:what]
    respond_to do |format|
      unless @what.blank?
        puts "what=#{@what}"
        format.html { redirect_to "#{@what}", notice: 'User was successfully created.' }
        format.js {render :what, notice: 'User was successfully created.' }
        format.json { render json: @what, status: :created, location: @what }
      else
        format.json { render json: @what.errors, status: :unprocessable_entity }
      end
    end
  end


end
