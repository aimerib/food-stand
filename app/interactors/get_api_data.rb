class GetApiData
  include Interactor
  require "uri"
  require "net/http"

  def call
    context.api_data = api_data
  end

  def api_data
    # This is a naive implementation, but works for a single, open endpoint.
    # If this was a rest api that we were consuming, I'd extract this to an
    # api client class that could have some custom error handling and recovery states.
    uri = URI("https://data.sfgov.org/resource/rqzj-sfat.json")
    res = Net::HTTP.get_response(uri)
    return JSON.parse(res.body, symbolize_names: true) if res.is_a?(Net::HTTPSuccess)
    context.fail!("Something went wrong")
  end
end
