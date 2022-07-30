require "test_helper"

class StandTest < ActiveSupport::TestCase
  test "should create new Stand" do
    stand_params = {
      name: "Soba Noodles Sobbing Good",
      facility_type: "Truck",
      description: "Japanese noodles",
      address: "123 Lala Ln",
      permit: "23212A-22",
      status: "APPROVED",
      latitude: 9.99,
      longitude: -9.99,
      object_id: "abc",
    }
    current_count = Stand.count
    Stand.create!(stand_params)
    assert(Stand.all.count == current_count + 1, "Test db should be empty")
  end
end
