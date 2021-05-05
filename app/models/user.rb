class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy
  has_many :outlays, foreign_key: 'author_id', dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
  validates :avatar, blob: { content_type: :image }

  def display_image
    avatar.variant(resize_to_limit: [500, 500])
  end
end
