class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  def index
    @tasks = params[:query] ? Tasks::FilterService.new(params[:query]).filter : Task.all

    respond_to do |format|
      format.html { render(index_view_component(tasks: @tasks)) }
      format.turbo_stream { turbo_response(@tasks) }
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      turbo_response(Task.all)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      turbo_response(Task.all)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    turbo_response(Task.all)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :done)
  end

  def index_view_component(tasks:)
    Tasks::Index::ViewComponent.new(tasks:)
  end

  def turbo_response(tasks)
    render turbo_stream: turbo_stream.replace(:tasks_index, index_view_component(tasks:))
  end
end
