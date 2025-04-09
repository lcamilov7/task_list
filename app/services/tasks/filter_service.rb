module Tasks
  class FilterService
    def initialize(params)
      @params = params
      @filtered_tasks = Task.all
    end

    attr_reader :params

    def filter
      apply_done_filter

      @relation
    end

    private

    def apply_done_filter
      return if params[:done].nil?

      @relation = Task.where(done: params[:done])
    end
  end
end
