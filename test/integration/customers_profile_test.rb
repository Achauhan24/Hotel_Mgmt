require 'test_helper'

class CustomersProfileTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include ApplicationHelper

  def setup
    @customer = customers(:michael)
  end

  test "profile display" do
    get customer_path(@customer)
    assert_template 'customers/show'
    assert_select 'title', full_title(@customer.name)
    assert_select 'h1', text: @customer.name
    assert_select 'h1>img.gravatar'
    assert_match @customer.microposts.count.to_s, response.body
    assert_select 'div.pagination'
    @customer.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end
