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

end
