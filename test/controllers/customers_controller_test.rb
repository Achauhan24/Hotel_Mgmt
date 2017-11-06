require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customers_new_url
    assert_response :success
  end
def setup	
	@customer=customers(:michael)
	@other_user=customers(:archer)
end


test "should redirect following when not logged in" do
	get following_customers_path(@customer)
	assert_redirected_to login_url
end
test "should redirect followers when not logged on" do
	get followers_customers_path(@customer) 
	assert_redirected_to login_url
end
end
