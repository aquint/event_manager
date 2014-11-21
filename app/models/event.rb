class Event < ActiveRecord::Base
	belongs_to :creator, class_name: "User"
	has_many :attendees, through: :memberships, foreign_key: "attended_event_id"
	has_many :memberships, foreign_key: "attended_event_id"
end
