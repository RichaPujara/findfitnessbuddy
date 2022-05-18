class BookingsController < ApplicationController

    before_action :set_booking, only: %i[show edit update destroy ]
    before_action :check_auth_model, only: [ :create, :new]  
    before_action :check_auth, only: %i[ show edit destroy update ]  
    
  # GET /bookings 
  def index
    @bookings = Booking.all
    authorize @bookings
  end

  # GET /bookings/1 
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
    @booking = Booking.new(workout_session_id: params[:workout_session_id], user_id: current_user.id)
    current_user.add_role :trainee, @booking.workout_session
    redirect_to @booking, notice: "Booking was successfully created."
  end

  # PATCH/PUT /bookings/1 
  def update
      if @booking.update(booking_params)
        redirect_to @booking, notice: "Booking was successfully updated." 
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  # DELETE /bookings/1 
  def destroy
    current_user.remove_role :trainee, @booking
    @booking.destroy
    redirect_to bookings_url, notice: "Booking was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:booking_approved)
    end

    # Check if a user is authorized to access the bookings
    def check_auth_model
        authorize Booking
    end

    def check_auth
        authorize @booking
    end

end
