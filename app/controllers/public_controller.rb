class PublicController < ApplicationController
  def index
  end

  def search
    result = FindClosestToUnionSquare.call(search_term: params[:search_term])
    @stand = result.stand
    respond_to do |format|
      if @stand.present?
        format.html { redirect_to stand_url(@stand) }
        format.json { render "stands/show", status: :found, location: @stand }
      else
        format.html { redirect_to root_path, status: :not_found, notice: "No food stands found matching #{params[:search_term]}" }
        format.json { render json: { error: "No stands found matching the search terms: #{params[:search_term]}" }, status: :unprocessable_entity }
      end
    end
  end
end
