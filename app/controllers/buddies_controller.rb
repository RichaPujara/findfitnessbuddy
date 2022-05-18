class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_buddy, only: %i[ show edit update destroy]

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

    respond_to do |format|
      if @buddy.save
        format.html { redirect_to buddy_url(@buddy), notice: "You are now setup as a Fitness Buddy!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buddies/1
  def update
    respond_to do |format|
      if @buddy.update(buddy_params)
        format.html { redirect_to buddy_url(@buddy), notice: "Your changes were saved successfully." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buddies/1
  def destroy
    @buddy.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "You were successfully removed as a Fitness Buddy." }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_buddy
      @buddy = Buddy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buddy_params
      params.require(:buddy).permit(:user_id, :name, :description, :location, :qualification)
    end

end
