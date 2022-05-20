class UsersController < ApplicationController
  
  def index
    @users = User.distinct(created_at: :desc)
    authorize @users
  end

end
