class DashboardController < ApplicationController
  before_action :get_all_areas
  def index
  end

  private

  def get_all_areas
    @areas ||= Area.all
  end
end
