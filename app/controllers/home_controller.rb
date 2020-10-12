class HomeController < ApplicationController
  def index
    @regionCount = Region.count
    @countryCount = Country.count
  end
end
