require "test_helper"

class FindClosestToUnionSquareTest < ActiveSupport::TestCase
  test "should return a valid stand close to Union Square" do
    result = FindClosestToUnionSquare.call(search_term: "japanese")
    assert_equal(result.stand.name, stands(:one).name)
  end

  test "should return new closer record instead" do
    food_stand_params =
      {
        object_id: "1571753",
        name: "The Japanese Sushi Taco",
        facility_type: "Truck",
        address: "3750 18TH ST",
        permit: "21MFF-00015",
        status: "APPROVED",
        description: "Japanese fusion: Sushi: Tacos",
        latitude: "37.76201920035647",
        longitude: "-122.42730642251331",
      }

    result = FindClosestToUnionSquare.call(search_term: "japanese")
    assert_equal(result.stand.name, stands(:one).name)
    new_stand = Stand.create! food_stand_params
    result = FindClosestToUnionSquare.call(search_term: "japanese")
    assert_equal(result.stand.name, new_stand.name)
  end
end
