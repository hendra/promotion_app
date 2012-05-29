class Promo < ActiveRecord::Base
  
  has_many :promo_business_details, dependent: :destroy
  validates :name, :description, :subtitle, :title, :presence => true
  attr_accessible :description, :end_date, :name, :redemption_details, 
    :start_date, :subtitle, :title, :promo_business_details_attributes
  
  accepts_nested_attributes_for :promo_business_details
  
end
