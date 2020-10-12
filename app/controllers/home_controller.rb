class HomeController < ApplicationController
  def index
    @wwConfirmed = PrimaryMetric.sum(:confirmed)
    @wwDeaths = PrimaryMetric.sum(:deaths)
    @wwRecovered = PrimaryMetric.sum(:recovered)
    @wwActive = PrimaryMetric.sum(:active)

  end
end
