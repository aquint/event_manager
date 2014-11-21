class Invitation < ActiveRecord::Base

	validates_uniqueness_of :attendee_id, scope: [:event_id, :creator_id]
	validates_uniqueness_of :creator_id, scope: [:attendee_id, :event_id]
	validates_uniqueness_of :event_id, scope: [:attendee_id, :creator_id]
	validates :attendee_id, presence: true

	belongs_to :event
	belongs_to :creator, class_name: "User"
	belongs_to :attendee, class_name: "User"
end
