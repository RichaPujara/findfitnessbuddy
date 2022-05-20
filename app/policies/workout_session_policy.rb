class WorkoutSessionPolicy < ApplicationPolicy
  
    attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
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
    @user.has_role? :fitness_buddy 
  end

  def new?
    create?
  end

  # To allow only the fitness buddy or admin users to edit/update the specific buddy profile.

  def update?
    @user.has_role?(:trainer, @record)
  end

  def nottrainer?
    
  end

  def mysessions?
   @user.has_role?(:fitness_buddy)
  end

  def edit?
    update?
  end
  
  # To allow only the the fitness buddy or admin users to delete the workout session.

  def destroy?
    @user.has_role?(:admin) || @user.has_role?(:trainer,@record)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end

end
