class BuddyPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #     scope.all
    # end

  end

 # To allow all users to view all buddy profiles 
  def index?
    true
  end
 
  # To allow all users to view a specific buddy profiles

  def show?
    true
  end

  # To allow all signed in users to create max of 1 buddy profile 

  def create?
    false if @user.has_role?(:fitness_buddy)
  end

  def new?
    create?
  end

  # To allow only the profile owner or admin users to edit/update the specific buddy profile.

  def update?
    @user.has_role? :buddy_profile_owner, @record
  end

  def edit?
    update?
  end
  
  # To allow only the profile owner or admin users to delete the buddy profile.

  def destroy?
    @user.has_role?(:admin) || @user.has_role?(:buddy_profile_owner, @record)
  end
end

