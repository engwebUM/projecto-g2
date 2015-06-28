# ExtrasController
class ExtrasController < ApplicationController
  before_action :set_extra, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /extras
  # GET /extras.json
  def index
    @extras = Extra.all
  end

  # GET /extras/1
  # GET /extras/1.json
  def show
  end

  # GET /extras/new
  def new
    @extra = Extra.new
  end

  # GET /extras/1/edit
  def edit
  end

  # POST /extras
  # POST /extras.json
  def create
    @extra = Extra.new(extra_params)

    respond_to do |format|
      if @extra.save
        format.html { redirect_to extras_path }
        format.json { render :show }
      else
        format.html { render :new }
        format.json { render json: @extra.errors }
      end
    end
  end

  # PATCH/PUT /extras/1
  # PATCH/PUT /extras/1.json
  def update
    respond_to do |format|
      if @extra.update(extra_params)
        format.html { redirect_to extras_path }
        format.json { render :show, status: :ok, location: @extra }
      else
        format.html { render :edit }
        format.json { render json: @extra.errors }
      end
    end
  end

  # DELETE /extras/1
  # DELETE /extras/1.json
  def destroy
    @extra.destroy
    respond_to do |format|
      format.html { redirect_to extras_url }
      format.json { head :no_content }
    end
    Partextra.where(extra_id: @extra.id).destroy_all
  end

  def add_multiple
    @p = Extra.test
    @extras = Extra.find(params[:extras])
    @extras.reject! do |extra|
      Partextra.create extra_id: extra.id, kind: extra.kind, participant_id: @p
    end
    redirect_to :back
  end

  def rem_multiple
    @i = Extra.last
    Extra.destroy(params[:extras])
    respond_to do |format|
      format.html { redirect_to remExtras_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_extra
    @extra = Extra.find(params[:id])
  end

  def extra_params
    params.require(:extra).permit(:kind, :money, :participant)
  end
end
