# typed: false
# frozen_string_literal: true

module Image
  # Generate SVG images
  class SvgComponent < ViewComponent::Base
    def initialize(icon:, classes: nil, id: nil, **args)
      @icon = icon
      @classes = classes
      @id = id
      @args = args
    end

    def call
      content_tag(:i, class: classes, id:, **args) do
        # rubocop:disable Rails/RenderInline
        render(inline: Rails.root.join("app/assets/images/#{icon}.svg").read)
        # rubocop:enable Rails/RenderInline
      end
    end

    private

    attr_reader :icon, :classes, :id, :args


    def render?
      Rails.root.join("app/assets/images/#{icon}.svg").exist?
    end
  end
end
