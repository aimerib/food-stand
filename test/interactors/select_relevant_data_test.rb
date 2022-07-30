require "test_helper"

class SelectRelevantDataTest < ActiveSupport::TestCase
  test "should return context with relevant data only" do
    result = SelectRelevantData.call(api_data: api_data)
    assert(result.success?)
    assert_equal(resulting_data, result.food_stand_params)
  end

  def api_data
    [
      { "objectid": "1571753", "applicant": "The Geez Freeze", "facilitytype": "Truck", "cnn": "887000", "locationdescription": "18TH ST: DOLORES ST to CHURCH ST (3700 - 3799)", "address": "3750 18TH ST", "blocklot": "3579006", "block": "3579", "lot": "006", "permit": "21MFF-00015", "status": "APPROVED", "fooditems": "Snow Cones: Soft Serve Ice Cream & Frozen Virgin Daiquiris", "x": "6004575.869", "y": "2105666.974", "latitude": "37.76201920035647", "longitude": "-122.42730642251331", "schedule": "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=21MFF-00015&ExportPDF=1&Filename=21MFF-00015_schedule.pdf", "approved": "2022-01-28T00:00:00.000", "received": "20210315", "priorpermit": "0", "expirationdate": "2022-11-15T00:00:00.000", "location": { "latitude": "37.76201920035647", "longitude": "-122.42730642251331", "human_address": "{\"address\": \"\", \"city\": \"\", \"state\": \"\", \"zip\": \"\"}" }, ":@computed_region_yftq_j783": "8", ":@computed_region_p5aj_wyqh": "4", ":@computed_region_rxqg_mtj9": "5", ":@computed_region_bh8s_q3mv": "28862", ":@computed_region_fyvs_ahh9": "3" },
    ]
  end

  def resulting_data
    [
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
  end
end
