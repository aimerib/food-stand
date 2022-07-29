class CreateNewStand
  include Interactor

  def call
    context.failed_stands = []
    context.food_stand_params.each do |food_stand|
      stand = Stand.new
      stand.attributes = food_stand
      context.failed_stands << food_stand unless stand.save
    end
  end
end
