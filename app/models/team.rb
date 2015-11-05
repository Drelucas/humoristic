class Team < ActiveRecord::Base
  belongs_to :user
  has_many :users_teams
  has_many :users, through: :users_teams
end
