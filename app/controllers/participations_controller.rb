class ParticipationsController < ApplicationController

  def index
    if current_user
	participationList = Participation.where(user_id: current_user.id)
	@rageList = Array.new()
        participationList.find_each do |participation|
           @rageList << Rage.find(participation.rage_id)
        end
    end
  end

  def create
    @participation = Participation.new
    @participation.user_id = current_user.id 
    @participation.rage_id = params[:rage_id] 
    @participation.isAuthor = false
    @participation.save

    respond_to do |format|
      if @participation.save
        format.html { redirect_to Participation, notice: 'Participation was successfully recorded.' }
        #format.json { render :show, status: :created, location: @rage }
      else
        format.html { render :index , notice: 'Participation was not recorded.' }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end


 private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end


end
