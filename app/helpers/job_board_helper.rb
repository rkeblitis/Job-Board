module JobBoardHelper

  def sort_jobs(jobs_array)
    jobs_array = Job.all.order("created_at DESC")
  end

  def time_elasped(created_at)
    # get elasped time in days, and make it a postive number:
    time_elasped = (((created_at - Time.now)/ 1.day).round) * -1
    if time_elasped == 0
      return "Today"
    elsif time_elasped == 1
      return "#{time_elasped} day ago"
    else
      return "#{time_elasped} days ago"
    end
  end

  def convert_to_pst(start_date)
    date = Date.parse(start_date.to_s)
    formated_date = "#{date.month}/#{date.day}/#{date.year}"
  end
end
