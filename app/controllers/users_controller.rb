class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@created_events = current_user.created_events.all
		@invitations = current_user.received_invitations.scoped.includes(:event)
		@upcoming_events  = current_user.upcoming_events
		@past_events  = current_user.past_events
	end
end
