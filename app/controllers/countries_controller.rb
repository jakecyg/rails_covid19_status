class CountriesController < ApplicationController
  def index
    @countries = Country.order('name asc').page(params[:page])
    @all_countries = PrimaryMetric.joins("INNER JOIN countries ON countries.id = primary_metrics.country_id")
                                  .pluck(:name, :confirmed, :deaths, :recovered, :active)
    @all_countries = Kaminari.paginate_array(@all_countries).page(params[:page]).per(5)
  end

  def show
  end

  def search
    @keyword = params[:q]
    @search_country = PrimaryMetric.joins("INNER JOIN countries ON countries.id = primary_metrics.country_id
                                           WHERE countries.name LIKE '%#{@keyword}%'")
                                  .pluck(:name, :confirmed, :deaths, :recovered, :active)
    # @sca = @search_country.to_a
  end
end
