class AddServings < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :servings, :integer
    add_column :meals, :servings, :integer, default: 2
  end
end
