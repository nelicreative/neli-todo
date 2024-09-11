class TaskStatusesController < ApplicationController
  before_action :load_task, only: :update

  def update
    if @task.may_toggle_status?
      @task.toggle_status!
      respond_with_message('Task status updated successfully.')
    end
  rescue AASM::InvalidTransition => e
    respond_with_message('Failed to update task status.')
  end

  private

  def load_task
    @task = Task.find_by(id: params[:id])
    unless @task
      render plain: 'Task not found', status: :not_found
    end
  end

  def respond_with_message(message)
    respond_to do |format|
      format.html { redirect_to tasks_path, alert: message }
      format.js
    end
  end
end
