class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where(user_id: current_user.id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PUBLISH /rages/1/publish
  def askModif

    @rage = Rage.find(params[:id])

    @message = Message.create(:title => "Rejected : " + @rage.title, :content => params[:content], :user_id => @rage.user_id)
    @message.save
    @rage.update_attribute(:state, 'waitingAmelioration')

    respond_to do |format|
      format.html { redirect_to rages_url, notice: 'Message envoyé et rage soumis à modification.' }
      format.json { head :no_content }
    end
  end

  # PUBLISH /rages/1/publish
  def rejectedRage

    @rage = Rage.find(params[:id])

    @message = Message.create(:title => "Rejected : " + @rage.title, :content => "Votre réclamation a été refusée car elle ne respectait pas les conditions d'utilisations, vous pouvez la soumettre à nouveau", :user_id => @rage.user_id)
    @message.save
    @rage.update_attribute(:state, 'waitingAmelioration')

    respond_to do |format|
      format.html { redirect_to rages_url, notice: 'Rage was successfully rejected.' }
      format.json { head :no_content }
    end
  end

  # PUBLISH /rages/1/publish
  def banRage

    @rage = Rage.find(params[:id])

    @message = Message.create(:title => "Rejected : " + @rage.title, :content => "Votre réclamation a été supprimée car elle ne respectait pas les conditions d'utilisations", :user_id => @rage.user_id)
    @message.save
    @rage.update_attribute(:state, 'banned')

    respond_to do |format|
      format.html { redirect_to rages_url, notice: 'Rage was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:title, :content)
  end
end
