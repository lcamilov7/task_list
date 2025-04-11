class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  def index
    @tasks = params[:query] ? Tasks::FilterService.new(params[:query]).filter : Task.all

    respond_to do |format|
      format.html { render(index_view_component(tasks: @tasks)) }
      format.turbo_stream { turbo_response(tasks: @tasks, params:) }
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      turbo_response(tasks: Task.all)
    else
      head :unprocessable_entity
    end
  end

  def edit; end

  def update
    head :unprocessable_entity unless @task.update(task_params)
  end

  def destroy
    @task.destroy
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :done)
  end

  def index_view_component(tasks:, params: nil)
    Tasks::Index::ViewComponent.new(tasks:, params:)
  end

  def turbo_response(tasks:, params: nil)
    render turbo_stream: turbo_stream.replace(:tasks_index, index_view_component(tasks:, params:))
  end
end
