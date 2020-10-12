class HomeController < ApplicationController
  def index
    @regions = Region.order('name asc')

  end
end
