class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy,:addExtras,:remExtras,:appeared,:gemBadge]
  before_action :require_login



  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
    @partextras = Partextra.all
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  def appeared
    p= @participant
    if p.appeared == false
      p.appeared = true
    else
      p.appeared = false
    end
    p.save
    redirect_to "/participants"
  end

  def gemBadge
    Badge.create :participant_id => @participant.id
    redirect_to "/participants"
  end

  def addExtras
    Extra.set_test(@participant.id)
    @extras = Extra.all
  end

  def remExtras
    Extra.set_test(@participant.id)
    @extras = Extra.all
    @pextras= Partextra.all
  end

  def import
    Participant.import(params[:file])
    redirect_to participants_path , notice: 'Participants was successfully created.'
  end



  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    respond_to do |format|
      if @participant.save
        format.html { redirect_to "/participants", notice: 'Participant was successfully created.' }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to "/participants", notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
      format.json { head :no_content }
    end
    Partextra.where(participant_id: @participant.id).destroy_all
    Badge.where(participant_id: @participant.id).destroy_all
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:name, :email, :appeared, :ticket_id)
    end
end
