class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :score
      t.references :oenologist, foreign_key: true
      t.references :wine, foreign_key: true

      t.timestamps
    end
  end
end
