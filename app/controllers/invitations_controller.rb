class InvitationsController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
		@invitation = current_user.sent_invitations.build(event_id: params[:event_id])
	end
	def create
		@invitation = current_user.sent_invitations.build(invitation_params)

		if @invitation.save
			flash[:success] = "Invitation Sent Successfully!"
			redirect_to current_user
		else
			flash.now[:danger] = "Error, Invitation not sent"
			render 'new'
		end
			
	end

	private
		def invitation_params
			params.require(:invitation).permit(:attendee_id, :event_id)
		end
end
