class PropertiesController < ApplicationController
  def index
    @properties = get_all_properties
  end

  private

  def get_all_properties
    'Propertiessssss will be called here'
  end

end
