module Tasks
  class CardComponent < ViewComponent::Base
    STIMULUS_CONTROLLER = 'tasks--card-component'


    def initialize(task:)
      @task = task
    end

    attr_reader :task

    private
  end
end
