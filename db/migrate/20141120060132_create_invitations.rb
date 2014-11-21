class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :creator_id
      t.integer :attendee_id
      t.integer :event_id

      t.timestamps
    end
  end
end
