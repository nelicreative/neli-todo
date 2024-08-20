class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks
  end
  
  def search
    @search = TaskSearch.new(params[:search])
    @tasks = @search.scope.where(user_id: current_user.id)
    render :index
  end

  def new
    @task = current_user.tasks.build
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    @task.workspace_id = 1  # Assuming the workspace ID is fixed or passed in some other way
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :time_start, :time_end)
  end
end
