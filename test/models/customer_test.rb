require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should follow and unfollow user" do
  	michael=customers(:michael)
  	archer=customers(:archer)
  	assert_not michael.following?(archer)
  	michael.follow(archer)
  	assert michael.following?(archer)
  	assert archer.followers.include?(michael)
  	michael.unfollow(archer)
  	assert_not michael.following?(archer)
end
