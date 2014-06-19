class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin
      can :manage, :all
    else
      can :show, :all
    end
  end

  def update?
    user.admin? || user == movie.user
  end
  alias_method :edit?, :update?
end
