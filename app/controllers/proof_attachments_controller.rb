class ProofAttachmentsController < ApplicationController
  before_action :set_proof_attachment, only: [:show, :edit, :update, :destroy]

  # GET /proof_attachments
  # GET /proof_attachments.json
  def index
    @proof_attachments = ProofAttachment.all
  end

  # GET /proof_attachments/1
  # GET /proof_attachments/1.json
  def show
  end

  # GET /proof_attachments/new
  def new
    @proof_attachment = ProofAttachment.new
  end

  # GET /proof_attachments/1/edit
  def edit
  end

  # POST /proof_attachments
  # POST /proof_attachments.json
  def create
    @proof_attachment = ProofAttachment.new(proof_attachment_params)

    respond_to do |format|
      if @proof_attachment.save
        format.html { redirect_to @proof_attachment, notice: 'Proof attachment was successfully created.' }
        format.json { render :show, status: :created, location: @proof_attachment }
      else
        format.html { render :new }
        format.json { render json: @proof_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proof_attachments/1
  # PATCH/PUT /proof_attachments/1.json
  def update
    respond_to do |format|
      if @proof_attachment.update(proof_attachment_params)
        format.html { redirect_to @proof_attachment, notice: 'Proof attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @proof_attachment }
      else
        format.html { render :edit }
        format.json { render json: @proof_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proof_attachments/1
  # DELETE /proof_attachments/1.json
  def destroy
    @proof_attachment.destroy
    respond_to do |format|
      format.html { redirect_to proof_attachments_url, notice: 'Proof attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proof_attachment
      @proof_attachment = ProofAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proof_attachment_params
      params.require(:proof_attachment).permit(:rage_id, :path)
    end
end
