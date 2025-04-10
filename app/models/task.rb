class Task < ActiveRecord::Base
  validates :title, length: { minimum: 3, maximum: 25 }
  validates :description, length: { minimum: 10, maximum: 600 }
end
