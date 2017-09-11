module CustomersHelper
	def gravatar_for(customer)
		gravatar_id=Digest::MD5::hexdigest(customer.email.downcase)
		gravatr_url="https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatr_url ,alt:customer.name,class: "gravatar" )
	end
end
