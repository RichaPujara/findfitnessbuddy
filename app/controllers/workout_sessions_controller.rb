class WorkoutSessionsController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :update, :destroy]

  before_action :set_workout_session, only: %i[ show edit update destroy ]

  # GET /workout_sessions or /workout_sessions.json
  def index
    @workout_sessions = WorkoutSession.all
  end

  # GET /workout_sessions/1 or /workout_sessions/1.json
  def show
    @booking = @workout_session.bookings.build
  end

  # GET /workout_sessions/new
  def new
    @workout_session = WorkoutSession.new
  end

  # GET /workout_sessions/1/edit
  def edit
  end

  # POST /workout_sessions or /workout_sessions.json
  def create
    @workout_session = WorkoutSession.new(workout_session_params)
    
    respond_to do |format|
      if @workout_session.save
        current_user.add_role :creator, @workout_session
        format.html { redirect_to workout_session_url(@workout_session), notice: "Workout session was successfully created." }
        format.json { render :show, status: :created, location: @workout_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_sessions/1 or /workout_sessions/1.json
  def update
    respond_to do |format|
      if @workout_session.update(workout_session_params)
        format.html { redirect_to workout_session_url(@workout_session), notice: "Workout session was successfully updated." }
        format.json { render :show, status: :ok, location: @workout_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_sessions/1 or /workout_sessions/1.json
  def destroy
    @workout_session.destroy

    respond_to do |format|
      format.html { redirect_to workout_sessions_url, notice: "Workout session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_session
      @workout_session = WorkoutSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_session_params
      params.require(:workout_session).permit(:start_time, :duration, :workout_type, :date, :workout_category, :description, :fees, :difficulty_level, :business_profile_id)
    end
end
