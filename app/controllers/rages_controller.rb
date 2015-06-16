class RagesController < ApplicationController
  before_action :set_rage, only: [:show, :edit, :update, :destroy]
  before_filter :check_user_logged_in!, :except => [:show, :index]

  # GET /rages
  # GET /rages.json
  def index
    if current_user
      @user = User.find(current_user.id)
      if @user.admin?
        @admin = true
      end
    end
    @rages = Rage.all
  end

  # GET /rages/1
  # GET /rages/1.json
  def show
  end

  # GET /rages/new
  def new
    @rage = Rage.new
  end

  # GET /rages/1/edit

  def edit
    @rage = Rage.find(params[:id])
    @user_id = current_user.id
  end

  # POST /rages
  # POST /rages.json
  def create
    @rage = Rage.new(rage_params)
    @rage.user_id = current_user.id

    respond_to do |format|
      if @rage.save
        format.html { redirect_to @rage, notice: 'Rage was successfully created.' }
        format.json { render :show, status: :created, location: @rage }
      else
        format.html { render :new }
        format.json { render json: @rage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rages/1
  # PATCH/PUT /rages/1.json
  def update
    respond_to do |format|
      if @rage.update(rage_params)
        format.html { redirect_to @rage, notice: 'Rage was successfully updated.' }
        format.json { render :show, status: :ok, location: @rage }
      else
        format.html { render :edit }
        format.json { render json: @rage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rages/1
  # DELETE /rages/1.json
  def destroy
    @rage.destroy
    respond_to do |format|
      format.html { redirect_to rages_url, notice: 'Rage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #create participation
  def participate
    @participation = Participation.new(participation_params)
    @participation.user_id = current_user.id
    @participation.rage_id = @rage.id
    @participation.isAuthor = false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rage
      @rage = Rage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rage_params
      params.require(:rage).permit(:title, :description, :picture)
    end
    def check_user_logged_in! # if admin is not logged in, user must be logged in
        authenticate_user! 
    end
end
