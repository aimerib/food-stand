class FindClosestToUnionSquare
  include Interactor
  delegate :search_term, to: :context

  # def initialize
  UNION_SQUARE = [37.786163522, -122.404498382]
  # end

  def call
    context.stand = Stand.where("description REGEXP ?", search_term.split(/ |,/).join("|")).where(status: "APPROVED").closest(origin: UNION_SQUARE).first
  end
end
