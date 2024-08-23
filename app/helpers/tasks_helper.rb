module TasksHelper
  def display_task_time(task)
    start_time = task.time_start.strftime('%B %d, %Y %H:%M')
    end_time = task.time_end.strftime('%B %d, %Y %H:%M')
    "#{start_time} -- #{end_time}"
  end
end
