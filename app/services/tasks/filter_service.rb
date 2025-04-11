module Tasks
  class FilterService
    def initialize(params)
      @params = params
    end

    attr_reader :params

    def filter
      return Task.all unless params

      apply_done_filter
      # Here we can keep adding methods to filter and using the @relation global that changes in every
      # method call
      @relation
    end

    private

    def apply_done_filter
      return if params[:done].nil?

      @relation = Task.where(done: params[:done])
    end
  end
end
