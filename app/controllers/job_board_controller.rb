class JobBoardController < ApplicationController


  def new
    @job = Job.new
    @jobs = Job.all

  end

  def create
    @job = Job.create(params.require(:job).permit(:title, :company, :location, :start_date, :salary, :description))
    if !params["categories"].nil?
      cats = Category.find(params["categories"])
      @job.categories << cats
    end
    @job.categories.create(name: params[:new_category]) if !params[:new_category].blank?
    redirect_to jobs_path
  end

  def results
    # @cats = SELECT  "categories".* FROM "categories" INNER JOIN "categorizations" ON "categories"."id" = "categorizations"."category_id" WHERE "categorizations"."job_id" = $1 AND "id"."id" = 8 LIMIT 1>
    # @categories = Jobs.Categroizations.where(Category.id = params[:filterCategories])
    categories = Category.find(params[:filterCategories])
     @results = []
     categories.each do |cat|
       @results << cat.jobs
     end
  end

end
