class Product < ActiveRecord::Base
  belongs_to :business
  validates :name, :retail_price, :discounted_price, :presence => true
  attr_accessor :nested_sequence
  attr_accessible :discounted_price, :name, :retail_price, :nested_sequence, :business_id
end
