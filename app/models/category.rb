class Category < ActiveRecord::Base
  has_many :jobs, :though => :categorization
end
