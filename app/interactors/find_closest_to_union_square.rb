class FindClosestToUnionSquare
  include Interactor
  delegate :search_term, to: :context

  UNION_SQUARE = [37.786163522, -122.404498382]

  def call
    # GeoKit gem provides methods to find distances between two geographic points by calling the .closest method on a model with acts_as_mapable defined.
    context.stand = Stand.where("description REGEXP ?", search_term.split(/ |,/).join("|")).where(status: "APPROVED").closest(origin: UNION_SQUARE).first
  end
end
