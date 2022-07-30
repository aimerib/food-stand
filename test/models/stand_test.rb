require "test_helper"

class StandTest < ActiveSupport::TestCase
  test "should create new Stand" do
    stand_params = {
      name: "Shoyu Naggingly Good Noodles",
      facility_type: "Truck",
      description: "Japanese noodles",
      address: "123 Lala Ln",
      permit: "23212A-22",
      status: "APPROVED",
      latitude: 9.99,
      longitude: -9.99,
      object_id: 1234,
    }
    assert(Stand.all.count == 2)
    stand = Stand.new(stand_params)
    assert(stand.valid?)
    stand.save
    assert(Stand.all.count == 3)
    assert_equal(stand_params[:name], Stand.last.name)
  end
  test "should not create new Stand with invalid params" do
    stand_params = {
      name: "Shoyu Naggingly Good Noodles",
      facility_type: "Truck",
      description: "Japanese noodles",
      address: "123 Lala Ln",
      permit: "23212A-22",
      status: "APPROVED",
      longitude: -9.99,
      object_id: "asf",
    }
    assert(Stand.count == 2)
    stand = Stand.new(stand_params)
    refute stand.valid?
    assert_not_nil stand.errors[:object_id]
    assert_not_nil stand.errors[:latitude]
    assert_nil(Stand.find_by(object_id: stand_params[:name]))
  end
end
