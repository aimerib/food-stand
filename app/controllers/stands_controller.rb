class StandsController < ApplicationController
  before_action :set_stand, only: :show

  # GET /stands/1 or /stands/1.json
  def show
  end

  private

  def set_stand
    @stand = Stand.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to root_path, notice: "Stand not found"
  end
end
