require "test_helper"

class CreateNewStandTest < ActiveSupport::TestCase
  test "should successfully create new stand" do
    food_stand_params = [
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
    assert_equal(Stand.count, 2)
    result = CreateNewStand.call(food_stand_params: food_stand_params)
    assert_equal(Stand.count, 3)
    assert_equal(Stand.last.object_id, 1571753)
    assert_equal(0, result.failed_stands.count)
  end
  test "should fail to create new stand with bad params" do
    food_stand_params = [
      {
        object_id: "1571753",
        name: "The Geez Freeze",
        facility_type: "Truck",
        longitude: "-122.42730642251331",
      },
      {
        object_id: "123",
        name: "The Geez Freeze",
        facility_type: "Truck",
        address: "3750 18TH ST",
        permit: "21MFF-00015",
        status: "APPROVED",
        description: "Snow Cones: Soft Serve Ice Cream & Frozen Virgin Daiquiris",
        latitude: "37.ddddd5647",
        longitude: "-122.sss",
      },
      {
        object_id: "15713",
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
    assert_equal(2, Stand.count)
    result = CreateNewStand.call(food_stand_params: food_stand_params)
    assert_equal(3, Stand.count)
    assert_equal(2, result.failed_stands.count)
  end
end
