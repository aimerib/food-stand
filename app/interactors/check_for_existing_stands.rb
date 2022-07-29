class CheckForExistingStands
  include Interactor
  delegate :food_stand_params, to: :context

  def call
    context.food_stand_params = context.food_stand_params.select { |food_stand|
      Stand.find_by(object_id: food_stand[:object_id]).nil?
    }
  end
end
