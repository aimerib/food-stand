class FetchApiDataDaily
  include Delayed::RecurringJob
  run_every 1.day
  run_at "12:00am"
  timezone "US/Eastern"
  queue "default"

  def perform
    GetApiDataAndGenerateFoodStands.call
  end
end
