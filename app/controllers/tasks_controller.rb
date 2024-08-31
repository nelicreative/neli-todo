class TasksController < ApplicationController
  before_action :load_task, only: [:edit, :update]
  before_action :load_tags, only: [:new, :edit] 

  def index
    @tasks = current_user.tasks
  end

  def search
    @tasks = current_user.tasks
    if params[:search_text].present?
      @tasks = @tasks.by_title(params[:search_text])
    elsif params[:search_date].present?
      if date_search?(params[:search_date])
        @tasks = @tasks.by_date(Date.parse(params[:search_date]))
      end
    end

    render :index
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.workspace_id = 1 
    if @task.save
      redirect_to tasks_path, notice: t('tasks.create.success')
    else
      load_tags
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      load_tags 
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :time_start, :time_end, :priority, :tag_list)
  end

  def load_task
    @task = Task.find(params[:id])
  end

  def load_tags
    @tags = ActsAsTaggableOn::Tag.limit(50) 
  end

  def date_search?(search)
    Date.parse(search) rescue false
  end
end
