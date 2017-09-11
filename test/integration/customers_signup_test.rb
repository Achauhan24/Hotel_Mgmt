require 'test_helper'

class CustomersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  	test "invalid signup information"
  	get signup_path
  	asset_no_difference 'Customer.count' do
  		post customers_path,params:{customer:{name:"",
  											   email:"foo@invalid",
  											   password:"foo",
  											   password_confirmation:"dude"
  											   }}
  	end
  	assert_template 'customers/new'

end
