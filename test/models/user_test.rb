require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #La methode suivante nous permet de vérifier la composition de :username :email
  def setup
    @user = User.new(username: "Example User", email: "user@example.com",
                 password: "foobar", password_confirmation: "foobar")
  end
  #les test suivant vont passer sur notre methode setup
   test "should be valid" do
     assert @user.valid?
   end

   test "name should be present" do
   @user.username = "     "
   assert_not @user.valid?
   end

    test "email should be present" do
   @user.email = "     "
   assert_not @user.valid?
   end

end
