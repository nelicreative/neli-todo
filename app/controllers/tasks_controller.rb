class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.build
    @tags = ActsAsTaggableOn::Tag.all
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.workspace_id = 1 # Assuming the workspace ID is fixed or passed in some other way
    logger.debug "Task before save: #{@task.inspect}"
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      logger.debug "Task save failed: #{@task.errors.full_messages.to_sentence}"
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :time_start, :time_end, :priority, :tag_list)
  end
end
