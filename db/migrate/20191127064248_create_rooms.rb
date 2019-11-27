class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.string :access_code
      t.string :color

      t.timestamps
    end
  end
end
