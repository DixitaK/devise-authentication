class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if @user.admin?
        scope.all
      else
        scope.where.not(body: "")
      end
  end
end 
end