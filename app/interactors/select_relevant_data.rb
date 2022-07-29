class SelectRelevantData
  include Interactor

  def call
    context.food_stand_params = food_stand_params
  end

  def food_stand_params
    context.api_data.map { |stand|
      stand.slice(:objectid, :applicant, :facilitytype, :address, :status, :permit, :fooditems, :latitude, :longitude).transform_keys { |key|
        case key
        when :objectid
          :object_id
        when :facilitytype
          :facility_type
        when :fooditems
          :description
        when :applicant
          :name
        else
          key
        end
      }
    }
  end
end
