require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "full_name returns full name of user capitalized" do
    # user com first_name 'Rafa' e last_name 'tester',
    # full_name me retorne 'Rafa Tester'
    user = User.new(first_name: 'Rafa', last_name:  'tester')

    assert_equal 'Rafa Tester', user.full_name

  end


  test "user cannot be validated without first_name" do
    user = User.new(email: 'rafa@tester', password: '123123')

    assert_equal false, user.valid?
  end
end
