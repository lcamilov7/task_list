class DrawerComponent < ViewComponent::Base
  renders_one :title

  def initialize
  end

  private

  def drawer_classes
    'bg-gray-50
    shadow-lg
    z-50
    fixed
    w-full
    h-2/4
    bottom-0
    right-0
    lg:top-0
    lg:right-0
    lg:bottom-auto
    lg:h-full
    lg:w-2/4'
  end
end
