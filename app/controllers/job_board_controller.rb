class JobBoardController < ApplicationController

  def new
    @job = Job.new

  end

  def create
    @job = Job.create(params.require(:job).permit(:title, :location, :start_date, :salary, :description))
    redirect_to jobs_path
  end

end
