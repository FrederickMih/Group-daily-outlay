class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :outlays, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  has_one_attached :avatar, dependent: :destroy

  # User Avatar Validation
  validates_integrity_of :avatar
  validates_processing_of :avatar

  private

  def avatar_size_validation
    errors[:avatar] << 'should be less than 500KB' if avatar.size > 0.5.megabytes
  end

  def display_image
    avatar.variant(resize_to_limit: [500, 500])
  end
end
