class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.text :description
      t.integer :preparation_time
      t.integer :cooking_time
      t.integer :portion
      t.references :food, foreign_key: true

      t.timestamps
    end
  end
end
