class PromoBusinessDetail < ActiveRecord::Base
  belongs_to :promo
  belongs_to :business
  belongs_to :product
  
  attr_accessor :nested_sequence
  attr_accessible :business_id, :discounted_price, :product_id, :retail_price, :promo_id, :nested_sequence
end
