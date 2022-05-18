class WorkoutSessionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

   # To allow all users to view all workout sessions 
  def index?
    true
  end
 
  # To allow all users to view a specific workout session

  def show?
    true
  end

  # To allow all registered fitness buddies to create workout sessions

  def create?
    !@user.has_role? :fitness_buddy
  end

  def new?
    create?
  end

  # To allow only the fitness buddy or admin users to edit/update the specific buddy profile.

  def update?
    @user.has_any_role?(:admin, :trainer)
  end

  def edit?
    update?
  end
  
  # To allow only the the fitness buddy or admin users to delete the workout session.

  def destroy?
    @user.has_any_role?(:admin, :trainer)
  end

end
