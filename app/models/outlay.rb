class Outlay < ApplicationRecord
   belongs_to :author, class_name: 'User'
   has_many :outlays_groups, dependent: :destroy
   has_many :groups, through: :outlays_groups
end
