class Group < ApplicationRecord
  belongs_to :user
  has_many :outlays_groups, dependent: :destroy
  has_many :outlays, through: :outlays_groups

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  has_one_attached :icon, dependent: :destroy
  validates :icon, blob: { content_type: :image }

  scope :alphabetically, -> { order('name') }

  def display_image
    icon.variant(resize_to_limit: [500, 500])
  end
end
