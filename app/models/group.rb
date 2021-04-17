class Group < ApplicationRecord
   belongs_to :user
   has_many :outlays, through: :outlays_groups
   has_many :outlays_groups
end
