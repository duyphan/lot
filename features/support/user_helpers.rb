module UserHelpers

	def create_visitor
	  @visitor ||= { :f_name => "Testy", :l_name => "McUserton", :email => "example@example.com", :password => "changeme", :password_confirmation => "changeme" }
	end
	def sign_up
	  delete_user
	  visit '/users/sign_up'
	  fill_in "full_name", :with => @visitor[:name]
	  fill_in "email", :with => @visitor[:email]
	  fill_in "password", :with => @visitor[:password]
	  fill_in "password_confirmation", :with => @visitor[:password_confirmation]
	  click_button "Sign up"
	  find_user
	end

	def find_user
	  @user ||= User.where(:email => @visitor[:email]).first
	end

	def create_unconfirmed_user
	  create_visitor
	  delete_user
	  sign_up
	  visit '/users/sign_out'
	end

	def create_user
	  create_visitor
	  delete_user
	  @user = FactoryGirl.create(:user, @visitor)
	end

	def delete_user
	  @user ||= User.where(:email => @visitor[:email]).first
	  @user.destroy unless @user.nil?
	end

	def sign_in
	  visit '/users/sign_in'
	  fill_in "email", :with => @visitor[:email]
	  fill_in "password", :with => @visitor[:password]
	  click_button "Log In"
	end
end

World(UserHelpers)