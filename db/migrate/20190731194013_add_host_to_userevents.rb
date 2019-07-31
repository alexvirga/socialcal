class AddHostToUserevents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_groups, :host, :boolean, default: false
  end
end
