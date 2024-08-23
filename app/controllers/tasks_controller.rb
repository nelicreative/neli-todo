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
    if @task.save
      redirect_to tasks_path, notice: t('tasks.create.success')
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :time_start, :time_end, :priority, :tag_list)
  end
end
