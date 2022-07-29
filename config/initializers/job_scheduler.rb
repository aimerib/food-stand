# The recommended way to schedule tasks according to delayed_job_recurring is to create a rake task to run during deployment,
# but this app will only run in local development, so adding the scheduling as an initializer to make demoing easier
require_relative "../../app/tasks/fetch_api_data_daily"
FetchApiDataDaily.schedule!
