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
end
