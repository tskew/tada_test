class DataController < ApplicationController
  before_action :set_datum, only: [:show, :edit, :update, :destroy]

  # GET /data
  # GET /data.json
  def index
    #regex checks if the input is an integer
    @data = Datum.all.limit((params[:top_x] =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/) ? params[:top_x] : nil)
    @supplier = Supplier.all
    respond_to do |format|
      format.html
      format.csv { send_data @data.to_csv }
    end
  end

  # GET /data/1
  # GET /data/1.json
  def show
    @supplier = Supplier.all
  end

  # GET /data/new
  def new
    @datum = Datum.new
    @supplier = Supplier.all
  end

  def import
    Datum.import(params[:file], params[:supplier_id])
    redirect_to supplier_reports_path(params[:supplier_id])
  end

  # GET /data/1/edit
  def edit
  end

  # POST /data
  # POST /data.json
  def create
    @datum = Supplier.Datum.build(datum_params)

    respond_to do |format|
      if @datum.save
        format.html { redirect_to @datum, notice: 'Datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data/1
  # PATCH/PUT /data/1.json
  def update
    respond_to do |format|
      if @datum.update(datum_params)
        format.html { redirect_to @datum, notice: 'Datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data/1
  # DELETE /data/1.json
  def destroy
    @datum.destroy
    respond_to do |format|
      format.html { redirect_to data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datum_params
      params.require(:datum).permit(:name, :phone, :supplier_id)
    end
end
