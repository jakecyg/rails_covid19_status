class CountriesController < ApplicationController
  def index
    @countries = Country.order('name asc')
  end

  def show
  end
end
