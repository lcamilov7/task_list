# typed: strict
# frozen_string_literal: true

module Tasks
  module Index
    class ViewComponent < ::ViewComponent::Base
      include Turbo::FramesHelper

      CLOCK_CONTROLLER = 'tasks--clock'

      def initialize(tasks:, params: nil)
        @tasks = tasks
        @params = params
      end

      attr_reader :tasks, :params

      private

      def done?
        params&.dig(:query, :done)
      end
    end
  end
end
