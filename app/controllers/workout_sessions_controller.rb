class WorkoutSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_workout_session, only: %i[ show edit update destroy ]
  before_action :get_buddy, only: %i[ new index ]
  before_action :check_auth

  # GET /buddies/:buddy_id/workout_sessions
  def index
    if params[:buddy_id].present?
      @workout_sessions = WorkoutSession.find_by(buddy_id: params[:buddy_id].to_i)
      #@workout_sessions = WorkoutSession.where(:buddies_id => params[:id])
      puts "Workout sessions: #{@workout_sessions}"
    else
      @workout_sessions = WorkoutSession.all
    end
    # if buddy_id.present?
    #   @workout_sessions = WorkoutSession.find_by_buddies_id(params(:buddies_id))
    # elsif params[:buddies_id].present?
    #   @workout_sessions = WorkoutSession.where(:buddies_id => params[:id])
    # else
    #   @workout_sessions = WorkoutSession.all
    # end
  end

  # GET /buddies/:buddy_id/workout_sessions/:id
  def show
  end

  # GET /buddies/:buddy_id/workout_sessions/new
  def new
  end

  # GET /buddies/:buddy_id/workout_sessions/:id/edit
  def edit
  end

  # POST /buddies/:buddy_id/workout_sessions
  def create
    @buddy = Buddy.find(params[:buddy_id])
    @workout_session = @buddy.workout_sessions.create(workout_session_params)
    
    if @workout_session.save
      @buddy.user.add_role :trainer, @workout_session
      redirect_to buddy_workout_session_path(@workout_session, @workout_session.id), notice: "Workout session was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /buddies/:buddy_id/workout_sessions/:id
  def update
    respond_to do |format|
      if @workout_session.update(workout_session_params)
        format.html { redirect_to @workout_session.buddy, notice: "Workout session was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buddies/:buddy_id/workout_sessions/:id
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

    def get_buddy
      @buddy = Buddy.find(params[:buddy_id])
    end

    # Only allow a list of trusted parameters through.
    def workout_session_params
      params.require(:workout_session).permit(:name, :date, :duration, :workout_type, :workout_category, :description, :fees, :difficulty_level, :buddy_id)
    end

    def check_auth
      authorize WorkoutSession
    end

end
