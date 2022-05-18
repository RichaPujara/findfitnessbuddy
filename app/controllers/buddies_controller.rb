class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_buddy, only: %i[ show edit update destroy]
  before_action :check_auth, only: %i[ edit update destroy ]

  # GET /buddies
  def index
    @buddies = Buddy.all
  end

  # GET /buddies/1
  def show
  end
  
  # GET /buddies/new
  def new
    @buddy = Buddy.new
  end

  # GET /buddy/1/edit
  def edit
  end
 
  # POST /buddies
  def create
    @buddy = Buddy.new(buddy_params)
    
    current_user.add_role :fitness_buddy
   
      if @buddy.save
        current_user.add_role :buddy_profile_owner, @buddy
        redirect_to buddy_url(@buddy), notice: "You are now setup as a Fitness Buddy!" 
      else
        render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /buddies/1
  def update
      if @buddy.update(buddy_params)
          redirect_to buddy_url(@buddy), notice: "Your changes were saved successfully." 
      else
          render :edit, status: :unprocessable_entity 
      end
  end

  # DELETE /buddies/1
  def destroy
    @buddy.destroy
    current_user.remove_role :fitness_buddy
    redirect_to root_url, notice: "You were successfully removed as a Fitness Buddy." 
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_buddy
      @buddy = Buddy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buddy_params
      params.require(:buddy).permit(:user_id, :name, :description, :location, :qualification, :avatar)
    end

    def check_auth
      authorize @buddy 
    end
end