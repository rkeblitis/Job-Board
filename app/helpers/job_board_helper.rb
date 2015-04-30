module JobBoardHelper

  def sort_jobs(jobs_array)
    jobs_array = Job.all.order("created_at DESC")
  end

  def days_posted(date)
    # get elasped time in days, and make it a postive number:
    time_elasped = (((date - Time.now)/ 1.day).round) * -1
    if time_elasped == 0
      return "Today"
    elsif time_elasped == 1
      return "#{time_elasped} day ago"
    else
      return "#{time_elasped} days ago"
    end
  end
end
