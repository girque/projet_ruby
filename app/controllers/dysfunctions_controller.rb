class DysfunctionsController < ApplicationController
  before_action :set_dysfunction, only: [:show, :edit, :update, :destroy]

  # GET /dysfunctions
  # GET /dysfunctions.json
  def index
    @dysfunctions = Dysfunction.all
  end

  # GET /dysfunctions/1
  # GET /dysfunctions/1.json
  def show
  end

  # GET /dysfunctions/new
  def new
    @dysfunction = Dysfunction.new
  end

  # GET /dysfunctions/1/edit
  def edit
  end

  # POST /dysfunctions
  # POST /dysfunctions.json
  def create
    @dysfunction = Dysfunction.new(dysfunction_params)

    respond_to do |format|
      if @dysfunction.save
        format.html { redirect_to @dysfunction, notice: 'Dysfunction was successfully created.' }
        format.json { render :show, status: :created, location: @dysfunction }
      else
        format.html { render :new }
        format.json { render json: @dysfunction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dysfunctions/1
  # PATCH/PUT /dysfunctions/1.json
  def update
    respond_to do |format|
      if @dysfunction.update(dysfunction_params)
        format.html { redirect_to @dysfunction, notice: 'Dysfunction was successfully updated.' }
        format.json { render :show, status: :ok, location: @dysfunction }
      else
        format.html { render :edit }
        format.json { render json: @dysfunction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dysfunctions/1
  # DELETE /dysfunctions/1.json
  def destroy
    @dysfunction.destroy
    respond_to do |format|
      format.html { redirect_to dysfunctions_url, notice: 'Dysfunction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dysfunction
      @dysfunction = Dysfunction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dysfunction_params
      params.require(:dysfunction).permit(:picture)
    end
end
