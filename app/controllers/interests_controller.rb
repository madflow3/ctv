class InterestsController < ApplicationController
	def new
		@interest = Interest.new
	end

	def create
		@interest = Interest.new(interest_params)
		if @interest.valid?
			@interest.save
			gb = Gibbon::API.new('55c2899ec9189665ff2b7cce4692dd69-us3')
			gb.lists.subscribe({id: '17ba7a018d', email: {email: @interest.email}, double_optin: true})
		end
	end

	private 
	def interest_params
		params.require(:interest).permit(:email)
	end
end
