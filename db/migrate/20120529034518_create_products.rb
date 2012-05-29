class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :retail_price
      t.float :discounted_price

      t.timestamps
    end
  end
end
