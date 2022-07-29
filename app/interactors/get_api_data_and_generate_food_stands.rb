class GetApiDataAndGenerateFoodStands
  include Interactor::Organizer

  organize GetApiData, SelectRelevantData, CheckForExistingStands, CreateNewStand
end
