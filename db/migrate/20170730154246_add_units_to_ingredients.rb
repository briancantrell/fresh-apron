class AddUnitsToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :units, :integer
  end
end
