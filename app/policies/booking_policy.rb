class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    # NOTE: Be explicit about which records you allow access to!
    def resolve
        scope.all
    end
  end

  # To allow all users to view all bookings with which the user is associated as a trainee, trainer or admin
  def index?
     @user.has_role? (:admin) 
  end
 
  # To allow users to view a specific booking they are associated with
  def show?
    @user.has_role?(:admin) || @user.has_role?(:trainer, @record) || @user.has_role?(:trainee, @record)
  end

  #To allow all signed in users to create a booking for a workout session
  def create
    true
  end

  def new?
    create?
  end

  # To allow only the profile owner or admin users to edit/update the specific booking (a trainer/admin can approve or disapprove the booking)
  def update?
    @user.has_role?(:admin) || @user.has_role?(:trainer, @record)
  end

  def mybookings?
    @user
  end

  def edit?
    update?
  end
  
  # To allow only the trainee or admin users to cancel the booking.
  def destroy?
    @user.has_role?(:trainee, @record) or @user.has_role?(:admin)
  end

end
