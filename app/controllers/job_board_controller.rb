class JobBoardController < ApplicationController

  # def index
  #   @jobs = Job.all
  # end

  def new
    @job = Job.new
    @jobs = Job.all

  end

  def create
    @job = Job.create(params.require(:job).permit(:title, :location, :start_date, :salary, :description))
    redirect_to jobs_path
  end

end
