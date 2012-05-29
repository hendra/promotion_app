class AddColumnPromoIdToPromoBusinessDetails < ActiveRecord::Migration
  def change
    add_column :promo_business_details, :promo_id, :integer
  end
end
