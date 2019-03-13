module ControllerMacros #because of devise
  #before all tests need a user to be logged in
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.create(
        email: 'test@test.com',
        password: 'password',
        first_name: 'Test',
        last_name: 'Tester',
        age: 28
      ) #this creates a user
      sign_in @user #this signs the user in
    end
  end

end
