class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
        scope.all
    end
  end

   # To allow all users to view all bookings with which the user is associated as a trainee, trainer or admin
  def index?
    @user.has_any_role?(:admin, :trainee, :trainer)
  end
 
  # To allow users to view a specific booking they are associated with

  def show?
    @user.has_any_role?(:admin, :trainer, :trainee)
  end

  # To allow all signed in users to create a booking at a workout session

  def create?
   return  @user && !@user.has_role?(:trainee)
  end

  def new?
    create?
  end

  # To allow only the profile owner or admin users to edit/update the specific booking (a trainer/admin can approve or disapprove the booking)

  def update?
    @user.has_any_role?(:admin, :trainer)
  end

  def edit?
    update?
  end
  
  # To allow only the trainee or admin users to cancel the booking.

  def destroy?
    @user.has_any_role?(:admin, :trainee)
  end

end
