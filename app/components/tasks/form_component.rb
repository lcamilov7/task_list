module Tasks
  class FormComponent < ViewComponent::Base
    DRAWER_CONTROLLER = 'drawer-component'

    def initialize(task:)
      @task = task
    end

    attr_reader :task

    private

    def title
      task.persisted? ? 'Edit Task' : 'Create Task'
    end

    def url
      task.persisted? ? task_path(task) : tasks_path
    end

    def save_copy
       task.persisted? ? 'Update' : 'Create'
    end
  end
end
