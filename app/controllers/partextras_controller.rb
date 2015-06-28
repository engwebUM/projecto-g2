# PartextrasController
class PartextrasController < ApplicationController
  before_action :set_partextra, only: [:destroy]
  before_action :require_login

  # DELETE /extras/1
  # DELETE /extras/1.json
  def destroy
    @partextra.destroy
    respond_to do |format|
      format.html { redirect_to extras_url }
      format.json { head :no_content }
    end
  end

  def rem_multiple
    Partextra.destroy(params[:partextras])
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_extra
    @extra = Partextra.find(params[:id])
  end

  def partextra_params
    params.require(:partextra).permit(:extra, :participant)
  end
end
