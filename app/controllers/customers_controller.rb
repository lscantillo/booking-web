class CustomersController < ApplicationController
  include Pagy::Backend
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.default
    @pagy, @customers = pagy(@customers, items: 10)
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      modal = params.require(:customer).permit(:modal)
      if @customer.save && modal[:modal] == "true"
        format.html { redirect_to new_booking_path, notice: "Cliente creado." }
        format.json { render :show, status: :created, location: @customer }
      elsif @customer.save
        format.html { redirect_to customers_path, notice: "Cliente creado." }
        format.json { render :show, status: :created, location: @customer }
      elsif modal[:modal] == "true"
        format.html { redirect_to new_booking_path, alert: "Error al crear cliente. #{@customer.errors.full_messages.join(", ")}" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_path, notice: "Cliente actualizado." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Cliente eliminado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :number_id, :email, :cellphone, :notes)
    end
end
