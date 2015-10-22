class ControlMood < ActiveRecord::Base
  belongs_to :moods
  belongs_to :users
end
