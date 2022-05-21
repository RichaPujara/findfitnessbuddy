class WorkoutSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_workout_session, only: %i[ show edit update destroy participants]
  before_action :get_buddy, only: %i[ new index create participants update destroy show]
  before_action :check_auth, only: %i[ edit, update, destroy]

  # GET /buddies/:buddy_id/workout_sessions
  def index
    if params[:buddy_id].present?
      @workout_sessions = WorkoutSession.find_by(buddy_id: params[:buddy_id].to_i)
    else
      @workout_sessions = WorkoutSession.all
    end
  end

  # GET /buddies/:buddy_id/workout_sessions/:id
  def show
    @booking = Booking.where("user_id = ? and workout_session_id = ?", current_user.id, params[:id]).first
  end

  def mysessions
    @buddy = current_user.buddy
    @mysessions = @buddy.workout_sessions
    authorize @mysessions if @mysessions
  end

  # GET /buddies/:buddy_id/workout_sessions/new
  def new
    @buddy = Buddy.find(params[:buddy_id])
    @workout_session = @buddy.workout_sessions.new
  end

  # GET /buddies/:buddy_id/workout_sessions/:id/edit
  def edit
    @buddy = Buddy.find(@workout_session.buddy_id)
  end

  # POST /buddies/:buddy_id/workout_sessions
  def create
    @workout_session = @buddy.workout_sessions.create(workout_session_params)
    if @workout_session.save
      @buddy.user.add_role :trainer, @workout_session
      redirect_to buddy_workout_session_path(@buddy, @workout_session.id), notice: "Workout session was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /buddies/:buddy_id/workout_sessions/:id
  def update
      if @workout_session.update(workout_session_params)
        redirect_to buddy_workout_session_path(@buddy, @workout_session.id), notice: "Workout session was successfully updated." 
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /buddies/:buddy_id/workout_sessions/:id
  def destroy
    if @workout_session.destroy
      redirect_to buddy_workout_sessions_path(@buddy), notice: "Workout session was successfully destroyed." 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def participants
    @traineeids = @workout_session.trainees.pluck(:id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_session
      @workout_session = WorkoutSession.find(params[:id])
    end

    def get_buddy
      unless params[:buddy_id].nil?
        @buddy = Buddy.find(params[:buddy_id])
      else
        @buddy = Buddy.find(@workout_session.buddy_id)
        params[:buddy_id] = @buddy.id
      end
    end

    # Only allow a list of trusted parameters through.
    def workout_session_params
      params.require(:workout_session).permit(:name, :date, :duration, :workout_type, :workout_category, :description, :fees, :difficulty_level)
    end

    def check_auth
      authorize @workout_session
    end

end
