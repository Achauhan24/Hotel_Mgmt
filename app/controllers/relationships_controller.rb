class RelationshipsController < ApplicationController
before_action :logged_in_customer

def create
customer=Customer.find(params[:followed_id])
current_customer.follow(customer)
redirect_to customer
end

def destroy
customer=Relationship.find(params[:id]).followed
current_customer.unfollow(customer)
redirect_to customer

end





end
