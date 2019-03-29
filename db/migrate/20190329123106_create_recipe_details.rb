class CreateRecipeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_details do |t|
      t.decimal :quantity
      t.boolean :optional, precision: 5, scale: 2
      t.references :recipe, foreign_key: true
      t.references :unit, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
