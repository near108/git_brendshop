class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      
      t.string      :recipe_name
      
      t.integer     :bean_1_id
      t.integer     :amount_1
      
      t.integer     :bean_2_id
      t.integer     :amount_2
      
      t.integer     :bean_3_id
      t.integer     :amount_3
      
      t.timestamps
    end
  end
end
