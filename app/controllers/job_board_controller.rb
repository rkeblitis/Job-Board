class JobBoardController < ApplicationController
include JobBoardHelper

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
    categories = Category.find(params[:filterCategories])
    @results = []
     categories.each do |cat|
       cat.jobs.each do |job|
         unless @results.include?(job)
          #  job_info = {title: job.title, location: job.location, description: job.description, company: job.company,
          #  start_date: convert_to_pst(job.start_date), date_posted: time_elasped(job.created_at)}
          #  @results << job_info
          @results << job
         end
       end
     end
    render json: @results
  end

end
