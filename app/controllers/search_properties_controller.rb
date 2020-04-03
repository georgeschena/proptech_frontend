require "net/http"
require "uri"

class SearchPropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @council_names_list = council_names
  end

  def create
    @response_from_api = parse_search_response
  end

  private

  def parse_search_response
    uri = URI.parse("https://planning-portal-scraper-api.herokuapp.com/search_properties")
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.path)
    req['Content-Type'] = 'application/json'

    req.body = {
      "council_name": params['council_name'],
      "description": params['description']
    }.to_json

    res = https.request(req)

    data = JSON.parse(res.body)
  end

  def council_names
    [
      ['https://planning.thanet.gov.uk'],
      ['Test']
    ]
  end

end
