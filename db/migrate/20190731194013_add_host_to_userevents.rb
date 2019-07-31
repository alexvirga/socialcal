class AddHostToUserevents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :host, :boolean, default: false
  end
end
