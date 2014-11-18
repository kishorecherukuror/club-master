class Ability
  include CanCan::Ability

  def initialize(user)
		if user && user.roles.find_by_name('admin')# method for user has administrative rights
		puts "****************************************"
		puts "****************************************"
		puts "****************************************"
		puts "****************************************"
		  can :manage, :all
		  can :access, :rails_admin
		  can :dashboard
		end
  end
end
