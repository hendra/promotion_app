class CreatePromoBusinessDetails < ActiveRecord::Migration
  def change
    create_table :promo_business_details do |t|
      t.integer :business_id
      t.integer :product_id
      t.float :retail_price
      t.float :discounted_price

      t.timestamps
    end
  end
end
