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
        @count = Participation.where(:rage_id => params[:rage_id]).count()

        if  @count == 10
        #envoi d'un mail
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

        #tweet
        begin
          Twitterbot.update("10 participations enregistrées pour la rage " + params[:rage_id])

        rescue Twitter::Error
          redirect_to root_path, :alert => "Hey Loser, Twitter says you cannot post same twice"

        rescue Exception => error
          redirect_to root_path, :alert => "An unknown error occured"
        end

        format.html { redirect_to Participation, notice: 'Participation was successfully recorded.' }
        #format.json { render :show, status: :created, location: @rage }

      else
        format.html { render :index , alert: 'Participation was not recorded.' }
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
