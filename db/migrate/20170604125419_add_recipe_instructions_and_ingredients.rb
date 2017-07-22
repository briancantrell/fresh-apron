class AddRecipeInstructionsAndIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.timestamps
    end

    create_table :recipe_ingredients do |t|
      t.decimal :quantity
      t.string :units
      t.references :recipe
      t.references :ingredient
      t.timestamps
    end

    add_column :recipes, :instructions, :text
  end
end
