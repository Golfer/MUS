class AreasController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json, :js
  def index
  end

  def show
    get_all_areas
  end


  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    respond_with({}) do |format|
      if @area.save
        format.html { redirect_to areas_path, notice: 'Area was created!' }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def area_params
    params.require(:area).permit(:name, :description)
  end

  def get_all_areas
    @areas ||= Area.all
  end
end
