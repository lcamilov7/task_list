class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  def index
    @tasks = Task.all
  end
  def new
    @task = Task.new
    render turbo_stream: turbo_stream.update('task_drawer_container', task_drawer(@task))
  end
  def create
    binding.irb
    @task = Task.new(task_params)

    if @task.save

    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit; end

  def update
    binding.irb
    if @task.update(task_params)

    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def task_drawer(task)
    Tasks::DrawerComponent.new(task:)
  end
end
