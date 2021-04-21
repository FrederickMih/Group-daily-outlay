class Group < ApplicationRecord
   belongs_to :user
   has_many :outlays, through: :outlays_groups
   has_many :outlays_groups, dependent: :destroy

   validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
   has_one_attached :icon, dependent: :destroy
  

   def display_image
      icon.variant(resize_to_limit: [500, 500])
   end
end
