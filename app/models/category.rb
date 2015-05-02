class Category < ActiveRecord::Base
  has_many :jobs, :through => :categorizations
  has_many :categorizations
end
