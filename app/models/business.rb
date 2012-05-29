class Business < ActiveRecord::Base
  has_many :products
  attr_accessor :nested_sequence
  attr_accessible :description, :name, :nested_sequence
  
  validates :name, :description, :presence => true
end
