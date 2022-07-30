require "test_helper"

class CheckForExistingStandsTest < ActiveSupport::TestCase
  test "should only create new stands when not in db already" do
    food_stand_params = [
      {
        name: "Soba Noodles Sobbing Good",
        facility_type: "Truck",
        description: "Japanese noodles",
        address: "123 Lala Ln",
        permit: "23212A-22",
        status: "APPROVED",
        latitude: 9.99,
        longitude: -9.99,
        object_id: 123,
      },
      {
        object_id: "1571753",
        name: "The Geez Freeze",
        facility_type: "Truck",
        address: "3750 18TH ST",
        permit: "21MFF-00015",
        status: "APPROVED",
        description: "Snow Cones: Soft Serve Ice Cream & Frozen Virgin Daiquiris",
        latitude: "37.76201920035647",
        longitude: "-122.42730642251331",
      },
    ]
    result = CheckForExistingStands.call(food_stand_params: food_stand_params)
    assert(result.success?)
    assert_equal([food_stand_params.last], result.food_stand_params)
  end
end
