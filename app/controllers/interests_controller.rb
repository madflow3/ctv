class InterestsController < ApplicationController
	def new
		@interest = Interest.new
	end

	def create
		@interest = Interest.new(interest_params)
		if @interest.valid?
			@interest.save
			gb = Gibbon::API.new(ENV['MAILCHIMP_KEY_ID'])
			gb.lists.subscribe({id: '17ba7a018d', email: {email: @interest.email}, double_optin: false})
		end
	end

	private 
	def interest_params
		params.require(:interest).permit(:email)
	end
end
