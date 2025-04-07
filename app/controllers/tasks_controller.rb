class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  def index
    @tasks = Task.all
    respond_to do |format|
      format.html { render(index_view_component(tasks: @tasks)) }
      format.turbo_stream
    end
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)

    if @task.save
      render turbo_stream: turbo_stream.update(:tasks_index, index_view_component(tasks: Task.all))
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit; end

  def update
    if @task.update(task_params)
      render turbo_stream: turbo_stream.update(:tasks_index, index_view_component(tasks: Task.all))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    render turbo_stream: turbo_stream.update(:tasks_index, index_view_component(tasks: Task.all))
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

  def index_view_component(tasks:)
    Tasks::Index::ViewComponent.new(tasks:)
  end
end
