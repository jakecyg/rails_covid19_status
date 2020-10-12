class CountriesController < ApplicationController
  def index
    @countries = Country.order('name asc').page(params[:page])
  end

  def show
  end
end
