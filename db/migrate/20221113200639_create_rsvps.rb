class CreateRsvps < ActiveRecord::Migration[7.0]
  def change
    create_table :rsvps do |t|

      t.timestamps
    end
    add_reference :rsvps, :attendee, index: true
    add_reference :rsvps, :attended_event, index: true
  end
end
