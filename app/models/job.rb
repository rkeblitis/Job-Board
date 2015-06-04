class Job < ActiveRecord::Base
  has_many :categories, :through => :categorizations
  has_many :categorizations

  # validates :title, presence: true
  # validates :company, presence: true
  # validates :location, presence: true
  # validates :description, presence: true
   validates :start_date, presence: true
  #validates :salary, presence: true



end


# category model
# that would have a category_name
# then on the create_job form a list of categoies could be added
# All checked categoies would be then associated with the job
#
# categories have many job_cat
#
# jobs has many job_cat
#
#
# there needs to be a job_category table
# that has a category_id and a job_id
# job_cat has many cateorys
# job_cat has many jobs
#
#
#
# job
# belongs to many categories though job_cats
#
# cat
# belongs to may jobs though job_cats
#
# job_cats
# has many job
# has many categories




# yeah, i think
# i always think of it this way: the model that holds the other model's id number is the one that belongs to the other one.
# like, it's got the other model's name tattooed on it
# because its heart belongs to that model
#
#
#
# i think they’re both has_many
# and the join is belongs to on both
# job
# has_many categories though
