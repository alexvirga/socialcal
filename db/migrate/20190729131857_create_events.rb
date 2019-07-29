class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :description
      t.string :host

      t.timestamps
    end
  end
end
