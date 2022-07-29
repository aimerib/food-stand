class CheckForExistingStands
  include Interactor
  delegate :food_stand_params, to: :context

  def call
    context.food_stand_params = context.food_stand_params.select { |food_stand|
      # If current food stand's object_id doesn't return a record, then we can
      # safely assume we haven't received this food stand from the API before
      Stand.find_by(object_id: food_stand[:object_id]).nil?
    }
  end
end
