module TasksHelper
  def display_task_time(task)
    start_time = l(task.time_start, format: :long)
    end_time = l(task.time_end, format: :long)
    "#{start_time} -- #{end_time}"
  end
end
