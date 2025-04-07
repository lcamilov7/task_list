class DrawerComponentReflex < ApplicationReflex
  def close
    morph("#task-drawer-container", "")
  end
end
