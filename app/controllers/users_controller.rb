class UsersController < ApplicationController
  
  def index
    @users = User.order(created_at: :desc)
    authorize @users
  end

end
