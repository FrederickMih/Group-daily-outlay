class Outlay < ApplicationRecord
   belongs_to :author, class_name: 'User'
   has_many :outlays_groups, dependent: :destroy
   has_many :groups, through: :outlays_groups

   validates :name, presence: true
   validates :amount, presence: true, numericality: {less_than: 20_000}
end
