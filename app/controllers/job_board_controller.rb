class JobBoardController < ApplicationController


  def new
    @job = Job.new
    @jobs = Job.all

  end

  def create
    @job = Job.create(params.require(:job).permit(:title, :company, :location, :start_date, :salary, :description))
    cats = Category.find(params["categories"])
    @job.categories << cats
    redirect_to jobs_path
  end

end
