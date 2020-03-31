require "net/http"

class PropertiesController < ApplicationController
  def index
    @properties = get_all_properties
  end

  private

  def get_all_properties
    url = "https://planning-portal-scraper-api.herokuapp.com/all_properties"

    response = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(response.body)
  end
end
