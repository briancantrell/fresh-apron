class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.integer :shopping_day, null: false, default: 0
      t.integer :meal_days, array: true, null: false, default: [2,4]
    end

    change_table :users do |t|
      t.string :auth_token
    end
  end
end
