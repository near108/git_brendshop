class CreateBeans < ActiveRecord::Migration[5.2]
  def change
    create_table :beans do |t|
      t.string        :country
      t.string        :grade
      t.string        :roast
      t.text          :comment
      t.timestamps
    end
  end
end
