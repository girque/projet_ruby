class ParticipationsController < ApplicationController


  def index
    if current_user
      participationList = Participation.where(user_id: current_user.id)
      @rageList = Array.new()
      participationList.find_each do |participation|
         @rageList << Rage.find(participation.rage_id)
      end
      @count = @rageList.count

      #envoi d'un mail
if  @count >= 10 && @count < 11
    message = <<EOF
From: infres6 <infres6@gmail.com>
To: user <user@gmail.com>
Subject: SMTP Test E-mail
Cette réclamation a atteint 10 personnes.
EOF

smtp = Net::SMTP.new 'smtp.gmail.com', 587
smtp.enable_starttls
smtp.start('gmail.com', 'infres6@gmail.com', 'infres6emanimes', :login)
smtp.send_message message, 'infres6@gmail.com', 'anas_yz@hotmail.fr'
smtp.finish
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
