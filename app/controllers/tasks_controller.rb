class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  # Each restful method responds with turbo stream with their .turbo_tream.erb file accordingly

  def index
    @tasks = Tasks::FilterService.new(params[:query]).filter

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
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    render :edit, status: :unprocessable_entity unless @task.update(task_params)
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
