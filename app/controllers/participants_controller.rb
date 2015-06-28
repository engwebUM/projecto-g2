class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy, :extras_add, :extras_rem, :appeared, :badge_gen]
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
    p = @participant
    if p.appeared == false
      p.appeared = true
    else
      p.appeared = false
    end
    p.save
    redirect_to participants_path
  end

  def badge_gen
    Badge.create participant_id: @participant.id
    redirect_to participants_path
  end

  def extras_add
    Extra.s_test(@participant.id)
    @extras = Extra.all
  end

  def extras_rem
    Extra.s_test(@participant.id)
    @extras = Extra.all
    @pextras = Partextra.all
  end

  def import
    Participant.import(params[:file])
    redirect_to participants_path
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    respond_to do |format|
      if @participant.save
        format.html { redirect_to participants_path }
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
        format.html { redirect_to participant_path }
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
      format.html { redirect_to participants_url }
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
