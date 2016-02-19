require 'csv'
class PatientsController < ApplicationController
  class CannotCreatePatientFromFile < Exception; end
  class UnPermittedFileFormat < Exception; end
  respond_to :html, :json, :js, :xls

  SHOW_ERROR_COUNT = 8
  ALLOW_FORMAT = %w(.csv).freeze

  before_action :patient, only: [:update_gender, :hide_patient, :show, :edit, :update, :destroy]
  before_action :building, only: [:export]
  before_action :area, only: [:import_file!]

  def index
    respond_with({}) do |format|
      format.html
      format.json { render json: @patients }
    end
  end

  def import_patients
  end

  def import
    @csv_file = params[:import_file]
    return if @csv_file.nil?
    begin
      @csv = CSV.parse(File.read(@csv_file.tempfile).gsub(/(\r+\n+)+/, "\r\n"))
    rescue => e
      fail CannotCreatePatientFromFile, e.message
    end

    @errors = []
    import_file!
    respond_with({}) do |format|
      format.html do
        render :import_patients, notice: 'Imported All patients for current building was successfully imported!'
      end
    end
  end

  def export
  end

  def update_gender
    gender = (params[:gender] == 'male') ? 'жін.' : 'чол.'
    @patient.update(gender: gender)
    respond_to :js
  end

  def hide_patient
    @patient.update(not_visible: params[:status])
    respond_to :js
  end

  def import_file!
    full_address = @csv.first
    building(full_address.first)
    Patient.transaction do
      @csv[1..-1].each_with_index do |row, index|
        patient = import_default(row)
        if patient.valid?
        else
          @errors << [index + 2, patient.errors.full_messages] unless patient.valid?
        end
        fail CannotCreatePatientFromFile, format_errors(@errors) if @errors.count > SHOW_ERROR_COUNT
      end
      fail CannotCreatePatientFromFile, format_errors(@errors) if @errors.present?
    end
    flash[:notice] = 'Patients was successfully Imported!'
    redirect_to root_path
  end

  def import_default(row)
    gender = 'чол.'
    Patient.create(building: @building, full_name: row[1]=='ПІБ' ? '-' : row[1] , gender: gender,
                   date_birth: row[1]=='ПІБ' ? '10.10.2012' : row[2].gsub(/\s+/, ''), appartment_number: row[0])
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def new_patient_for_building
    @building ||= Building.find(params[:id])
    @patient = Patient.new
    respond_with({}) do |format|
      if @patient.save
        format.html { redirect_to patients_building_path(@building), notice: 'Patients was created!' }
      else
        format.html { render :new_patient_for_building }
        # format.json { render json: patients_building_path(@building).errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @building ||= Building.find(params[:building_id])
    @patient = Patient.new(patient_params)
    respond_with({}) do |format|
      if @patient.save
        format.html { redirect_to patients_building_path(@building), notice: 'Patient was created!' }
      else
        format.html { render :new_patient_for_building }
        # format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_with({}) do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patients_building_path(@patient.building), notice: 'Patient was successfully updated!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to :js
  end

  def format_errors(errors)
    error_msg = errors.take(SHOW_ERROR_COUNT).map do |error|
      "line ##{error.first}: #{error.second.join(', ')}."
    end.join('<br/>')
    "File has errors.<br/>#{error_msg}#{'<br/>...' if errors.count > SHOW_ERROR_COUNT}"
  end

  private

  def building
    @building ||= Building.find(params[:id])
  end

  def patient
    @patient = Patient.find(params[:id])
  end

  def area
    @area ||= Area.first_or_create(name: '11')
  end

  def building(full_address)
    exists_building = Building.find(params[:building_id])
    @building ||= if exists_building.full_address == full_address
                    exists_building
                  else
                    Building.create(full_address: full_address, area_id: 1)
                  end
  end

  def patient_params
    params.require(:patient).permit(:full_name, :gender, :date_birth, :appartment_number, :phone, :preferential_categories, :building_id)
  end
end
