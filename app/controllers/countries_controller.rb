class CountriesController < ApplicationController
  def index
    @countries = Country.order('name asc').page(params[:page])
    @all_countries = PrimaryMetric.joins('INNER JOIN countries ON countries.id = primary_metrics.country_id')
                                  .pluck(:name,
                                         :confirmed,
                                         :deaths,
                                         :recovered,
                                         :active,
                                         :country_id)
    @all_countries = Kaminari.paginate_array(@all_countries).page(params[:page]).per(5)
  end

  def show
    @country = Country.find(params[:id])
    @complete_metrics = Country.joins("INNER JOIN primary_metrics ON countries.id = primary_metrics.country_id
                                       INNER JOIN secondary_metrics ON countries.id = secondary_metrics.country_id
                                       WHERE countries.id = #{params[:id]}")
                               .pluck(:name,
                                      :confirmed,
                                      :deaths,
                                      :recovered,
                                      :active,
                                      :deathPerHundred,
                                      :recoveredPerHundred,
                                      :deathPerHundredRecovered)
  end

  def search
    @keyword = params[:q]
    @search_country = PrimaryMetric.joins("INNER JOIN countries ON countries.id = primary_metrics.country_id
                                           WHERE countries.name LIKE '%#{@keyword}%'")
                                   .pluck(:name,
                                          :confirmed,
                                          :deaths,
                                          :recovered,
                                          :active)
  end
end
