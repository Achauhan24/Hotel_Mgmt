module CustomersHelper
	def gravatar_for(customer,options={size: 80})
		gravatar_id=Digest::MD5::hexdigest(customer.email.downcase)
		size=options[:size]
		gravatr_url="https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatr_url ,alt:customer.name,class: "gravatar" )
	end
end
