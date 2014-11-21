class Membership < ActiveRecord::Base

	validates_uniqueness_of :attended_event_id, scope: [:attendee_id]
	validates_uniqueness_of :attendee_id, scope: [:attended_event_id]

	belongs_to :attended_event, class_name: "Event"
	belongs_to :attendee, class_name: "User"
end
