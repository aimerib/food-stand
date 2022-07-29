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
        format.html { render "404", status: :not_found, locals: { search_term: params[:search_term] } }
        format.json { render json: { error: "No stands found matching the search terms: #{params[:search_term]}" }, status: :unprocessable_entity }
      end
    end
  end
end
