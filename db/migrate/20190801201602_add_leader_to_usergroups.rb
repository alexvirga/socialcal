class AddLeaderToUsergroups < ActiveRecord::Migration[5.2]
  def change
    add_column :user_groups, :leader, :boolean, default: false
  end
end
