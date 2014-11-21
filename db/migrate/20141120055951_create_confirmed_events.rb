class CreateConfirmedEvents < ActiveRecord::Migration
  def change
    create_table :confirmed_events do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
