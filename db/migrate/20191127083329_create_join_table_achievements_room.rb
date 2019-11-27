class CreateJoinTableAchievementsRoom < ActiveRecord::Migration[5.2]
  def change
    create_join_table :achievements, :rooms do |t|
      t.references :achievement, foreign_key: true
      t.references :room, foreign_key: true
    end
  end
end
