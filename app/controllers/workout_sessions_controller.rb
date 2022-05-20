class WorkoutSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_workout_session, only: %i[ show edit update destroy ]
  before_action :get_buddy, only: %i[ new index ]
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
  end

  def mysessions
    @mysessions = current_user.buddy.workout_sessions
    authorize @mysessions if @mysessions
  end

  # GET /buddies/:buddy_id/workout_sessions/new
  def new
    @buddy = Buddy.find(params[:buddy_id])
    @workout_session = @buddy.workout_sessions.new
  end

  # GET /buddies/:buddy_id/workout_sessions/:id/edit
  def edit
  end

  # POST /buddies/:buddy_id/workout_sessions
  def create
    @buddy = Buddy.find(params[:buddy_id])
    @workout_session = @buddy.workout_sessions.create(workout_session_params,)
    # @workout_session = WorkoutSession.new(buddy_id: params[:buddy_id],workout_session_params)

    # @booking = Booking.new(workout_session_id: params[:workout_session_id], user_id: current_user.id)
    
    if @workout_session.save
      @buddy.user.add_role :trainer, @workout_session
      redirect_to buddy_workout_session_path(@workout_session, @workout_session.id), notice: "Workout session was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /buddies/:buddy_id/workout_sessions/:id
  def update
    
      if @workout_session.update(workout_session_params)
        redirect_to @workout_session.buddy, notice: "Workout session was successfully updated." 
      else
        render :edit, status: :unprocessable_entity
      end
    
  end

  # DELETE /buddies/:buddy_id/workout_sessions/:id
  def destroy
    @workout_session.destroy
    redirect_to workout_sessions_url, notice: "Workout session was successfully destroyed." 
     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_session
      @workout_session = WorkoutSession.find(params[:id])
    end

    def get_buddy
      @buddy = Buddy.find(params[:buddy_id])
    end

    # Only allow a list of trusted parameters through.
    def workout_session_params
      params.require(:workout_session).permit(:name, :date, :duration, :workout_type, :workout_category, :description, :fees, :difficulty_level)
    end

    def check_auth
      authorize @workout_session
    end

end
