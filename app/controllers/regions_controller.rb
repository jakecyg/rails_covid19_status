class RegionsController < ApplicationController
  def index
    @regionTotalConfirmedArray = []
    @regionTotalDeathArray = []
    @regionTotalRecoveredArray = []
    @regionTotalactiveArray = []

    @regions = Region.order('name asc')
    @regions.each do |r|
      @regionTotalConfirmedArray << PrimaryMetric.joins("INNER JOIN countries ON countries.id = primary_metrics.country_id
                                                         INNER JOIN regions ON regions.id     = countries.region_id
                                                         WHERE regions.name                   = '#{r.name}'").sum(:confirmed)
      @regionTotalDeathArray << PrimaryMetric.joins("INNER JOIN countries ON countries.id = primary_metrics.country_id
                                                     INNER JOIN regions ON regions.id     = countries.region_id
                                                     WHERE regions.name                   = '#{r.name}'").sum(:deaths)

      @regionTotalRecoveredArray << PrimaryMetric.joins("INNER JOIN countries ON countries.id = primary_metrics.country_id
                                                         INNER JOIN regions ON regions.id     = countries.region_id
                                                         WHERE regions.name                   = '#{r.name}'").sum(:recovered)
      @regionTotalactiveArray << PrimaryMetric.joins("INNER JOIN countries ON countries.id = primary_metrics.country_id
                                                      INNER JOIN regions ON regions.id     = countries.region_id
                                                      WHERE regions.name                   = '#{r.name}'").sum(:active)
    end
    # why does second work but not first; according to docs they produce same SQL command(cmd f: Now all of the following will produce the expected join queries using INNER JOIN: )
    # test = PrimaryMetric.joins(:countries)
    # Author.joins("INNER JOIN posts ON posts.author_id = authors.id AND posts.published = 't'")
  end

  def show; end
end
