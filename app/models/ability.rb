class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    
    user.admin? ? (can :manage, :all) : (can :show, :all)
  end
end
