class UserPolicy < ApplicationPolicy
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
    @user.has_any_role? :admin, :owner
  end
end
