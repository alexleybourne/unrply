class CreateRoomsUserSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms_user_settings do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.string :nickname
      t.boolean :admin

      t.timestamps
    end
  end
end
