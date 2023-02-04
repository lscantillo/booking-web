class RatesController < ApplicationController
  include Pagy::Backend
  before_action :set_rate, only: %i[ show edit update destroy ]

  # GET /rates or /rates.json
  def index
  @rates = Rate.all.order(:room_id)
  @pagy, @rates = pagy(@rates, items: 10)
  end

  # GET /rates/1 or /rates/1.json
  def show
  end

  # GET /rates/new
  def new
    @rate = Rate.new
  end

  # GET /rates/1/edit
  def edit
  end

  # POST /rates or /rates.json
  def create
    @rate = Rate.new(rate_params)

    respond_to do |format|
      if @rate.save
        format.html { redirect_to rates_url, notice: "Tarifa creada correctamente" }
        format.json { render :show, status: :created, location: @rate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rates/1 or /rates/1.json
  def update
    respond_to do |format|
      if @rate.update(rate_params)
        format.html { redirect_to rates_path, notice: "Tarifa Actualizada" }
        format.json { render :show, status: :ok, location: @rate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rates/1 or /rates/1.json
  def destroy
    @rate.destroy

    respond_to do |format|
      format.html { redirect_to rates_url, status: :see_other,
                                notice: "Tarifa Borrada." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rate_params
      params.require(:rate).permit(:name, :start_at, :end_at, :price, :room_id)
    end
end