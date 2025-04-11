class DrawerComponentReflex < ApplicationReflex
  # Tenantive reflex use removed since it requires redis and cahcing enabled in production env.
  # But it a great stretgy that enables reactive UI updates in rails with minimal javaScript by
  #  leveraging Turbo and ActionCable for DOM updates from the backend,
  #  and supports rails core backend logic
  def close
    morph("#task-drawer-container", "")
  end
end
