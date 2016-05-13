class DashboardsController < ApplicationController
  before_action :get_all_areas, only:

  def index
  end

  def get_all_areas
    @areas ||= Area.all
  end
end
