class AddTitleDateLocationToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :title, :string
    add_column :events, :date, :datetime
    add_column :events, :location, :text
  end
end
