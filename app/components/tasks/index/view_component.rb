# typed: strict
# frozen_string_literal: true

module Tasks
  module Index
    class ViewComponent < ::ViewComponent::Base
      include Turbo::FramesHelper

      CLOCK_CONTROLLER = 'tasks--clock'

      def initialize(tasks:)
        @tasks = tasks
      end

      attr_reader :tasks
    end
  end
end
