class MembershipsController < ApplicationController
	def create
		event = Event.find(params[:membership][:attended_event_id])
		user = current_user
		user.accept_invite(event)
		redirect_to current_user
	end
end
