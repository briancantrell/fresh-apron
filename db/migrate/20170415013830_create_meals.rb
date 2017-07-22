class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.references :recipe
      t.datetime :scheduled_at
      t.timestamps
    end
  end
end
