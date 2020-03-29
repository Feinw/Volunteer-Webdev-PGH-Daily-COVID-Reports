class AdmissionDataController < ApplicationController
  before_action :set_admission_datum, only: [:show, :edit, :update, :destroy]

  # GET /admission_data
  # GET /admission_data.json
  def index
    @admission_data = AdmissionDatum.all
  end

  # GET /admission_data/1
  # GET /admission_data/1.json
  def show
  end

  # GET /admission_data/new
  def new
    @admission_datum = AdmissionDatum.new
  end

  # GET /admission_data/1/edit
  def edit
  end

  # POST /admission_data
  # POST /admission_data.json
  def create
    @admission_datum = AdmissionDatum.new(admission_datum_params)

    respond_to do |format|
      if @admission_datum.save
        format.html { redirect_to @admission_datum, notice: 'Admission datum was successfully created.' }
        format.json { render :show, status: :created, location: @admission_datum }
      else
        format.html { render :new }
        format.json { render json: @admission_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admission_data/1
  # PATCH/PUT /admission_data/1.json
  def update
    respond_to do |format|
      if @admission_datum.update(admission_datum_params)
        format.html { redirect_to @admission_datum, notice: 'Admission datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @admission_datum }
      else
        format.html { render :edit }
        format.json { render json: @admission_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admission_data/1
  # DELETE /admission_data/1.json
  def destroy
    @admission_datum.destroy
    respond_to do |format|
      format.html { redirect_to admission_data_url, notice: 'Admission datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admission_datum
      @admission_datum = AdmissionDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admission_datum_params
      params.require(:admission_datum).permit(:date, :covid_status, :hospital_status, :details, :cases)
    end
end
