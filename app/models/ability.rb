class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    if user.role.to_s == 'admin' || user.role.to_s == 'sale'
        can :manage, :all
    else
    	can :read, :all
    end

    
  end
end
