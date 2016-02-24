class BuildingsController < ApplicationController
  respond_to :html, :json, :js, :xls
  before_action :area, only: [:index, :new, :create, :edit, :update]
  before_action :building, only: [:patients, :show, :edit, :update, :destroy]
  before_action :buildings

  def index
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    respond_with({}) do |format|
      if @building.save
        format.html { redirect_to root_path, notice: 'Building was created!' }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
  end

  def patients
  end

  def export_patients
    @building ||= Building.find(params[:building_id])
    @building_patients = @building.patients.order_by_appartment_number
    @building_full_name = @building.full_address
    respond_with(&:xls)
  end

  def export_all_area_patients
    @all_buildings ||= Area.find_by_name('11').buildings
    respond_with(&:xls)
  end


  def update
    respond_with({}) do |format|
      if @building.update(building_params)
        format.html do
          flash[:notice] = 'Building was successfully updated!'
          redirect_to root_path
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @building.destroy
    respond_with({}) do |format|
      format.html do
        flash[:notice] = 'Building was successfully destroyed!'
        redirect_to root_path
      end
      format.json { head :no_content }
    end
  end

  private

  def area
    @area ||= Area.first_or_create(name: '11')
  end

  def building
    @building ||= Building.find(params[:id])
  end

  def buildings
    @buildings ||= Building.where(area: @area)
  end

  def building_params
    params.require(:building).permit(:full_address, :position_id, :area_id, :description)
  end
end
