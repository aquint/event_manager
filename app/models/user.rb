class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :sent_invitations, foreign_key: "creator_id", class_name: "Invitation"
  has_many :received_invitations, foreign_key: "attendee_id", class_name: "Invitation"
  has_many :attended_events, through: :memberships, foreign_key: "attendee_id"
  has_many :memberships, foreign_key: "attendee_id"

  def accept_invite(event)
  	memberships.create(attended_event_id: event.id)
  end
  def reject_invite(event)
  	memberships.find_by(attended_event_id: event.id).destroy
  end
  def upcoming_events
  	attended_events.where("event_date > ?", Time.now)
  end
  def past_events
  	attended_events.where("event_date < ?", Time.now)
  end
end
