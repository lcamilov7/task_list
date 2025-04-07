module Tasks
  class ListComponent < ViewComponent::Base
    def initialize(tasks:)
      @tasks = tasks
    end

    attr_reader :tasks

    private
  end
end
