namespace :recurring do
  task init: :environment do
    FetchApiDataDaily.schedule!
  end
end
