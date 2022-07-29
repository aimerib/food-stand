class ApplicationController < ActionController::Base
  # In production I would protect the JSON api behind a token based AuthenticatedController
  protect_from_forgery unless: -> { request.format.json? }
end
