class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
        scope.all
    end
  end

  def index?
    @user.has_role? :admin
  end
  def show?
    @user.has_any_role? :admin, :owner(@profile)
  end
  def edit?
    update?
  end
  def update?
    @user.has_any_role? :admin, :owner(@profile)
  end
  def destroy?
    @user.has_any_role? :admin, :owner(@profile)
  end
end
