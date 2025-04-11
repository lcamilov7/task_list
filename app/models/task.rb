class Task < ActiveRecord::Base
  validates :title, length: { minimum: 3, maximum: 25 }
  validates :description, length: { minimum: 10, maximum: 600 }

  before_update :set_done_time, if: -> { will_save_change_to_done? }

  private

  def set_done_time
    self.done_at = Time.now if done
  end
end
