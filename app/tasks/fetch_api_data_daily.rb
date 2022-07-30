class FetchApiDataDaily
  include Delayed::RecurringJob

  # SF Api only updates once a day, so we can safely run this job only once a day as well
  run_every 1.day
  run_at "12:00am"
  timezone "US/Eastern"
  queue "default"

  def perform
    GetApiDataAndGenerateFoodStands.call
  end
end
