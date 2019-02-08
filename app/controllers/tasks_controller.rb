class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to index_path
  end

  def show
    set_task
  end

  def update
    set_task
    @task.update(task_params)
    redirect_to index_path(@task)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    set_task
  end

  def destroy
    set_task
    @task.destroy
    redirect_to index_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
