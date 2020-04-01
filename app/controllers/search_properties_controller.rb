require "net/http"
require "uri"

class SearchPropertiesController < ApplicationController
  def index; end

  def create
    @response_from_api = parse_search_response
  end

  private

  def parse_search_response
    uri = URI.parse("http://127.0.0.1:5000/search_properties")
    https = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.path)
    req['Content-Type'] = 'application/json'

    req.body = {
      "council_name": params['council_name'],
      "reference_number": params['reference_number']
    }.to_json

    res = https.request(req)

    data = JSON.parse(res.body)
  end
end
