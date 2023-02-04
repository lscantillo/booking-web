class BookingsController < ApplicationController
  include Pagy::Backend
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
    @pagy, @bookings = pagy(@bookings, items: 10)
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    status = params[:booking][:status].to_i
    @booking = Booking.new(
      booking_params.merge(:status => status)
    )

    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_path, notice: "Reserva creada." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    status = params[:booking][:status].to_i
    respond_to do |format|
      if @booking.update(booking_params.merge(:status => status))
        format.html { redirect_to bookings_path, notice: "Reserva Actualizada." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:status, :description, :start_at, :end_at, :room_id, :customer_id).with_defaults(:customer_id => 1)
    end
end
