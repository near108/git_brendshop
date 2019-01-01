class CreateArranges < ActiveRecord::Migration[5.2]
  def change
    create_table :arranges do |t|
      t.string :category
      t.string :title
      t.string :info
      t.text :howto
      t.text :image_url
      
      t.timestamps
    end
  end
end
