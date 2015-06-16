class ParticipationsController < ApplicationController

  def index
    if current_user
	@participationList = Participation.find(user_id = current_user.id)
    end
  end
end
