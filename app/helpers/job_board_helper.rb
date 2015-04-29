module JobBoardHelper

  def sort_jobs(jobs_array)
    jobs_array = Job.all.order("created_at DESC")
  end

end
