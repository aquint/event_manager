class EventsController < ApplicationController
	def new
		@event = current_user.created_events.build
	end
	def create
		@event = current_user.created_events.build(event_params)
		if @event.save
			flash[:success] = "Event created successfully!"
			redirect_to @event
		else
			flash.now[:danger] = "Event creation failed."
			render 'new'
		end
	end
	def show
		@event = Event.find(params[:id])
		@creator = User.find(@event.creator_id)
	end
	def index
		@events = Event.all
	end
	def destroy
	end

	private

		def event_params
			params.require(:event).permit(:name, :description, :event_date)
		end
end
