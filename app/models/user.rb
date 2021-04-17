class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy
  has_many :outlays, foreign_key: 'author_id', dependent: :destroy       

  validates :name, presence: true, uniquenesss: true, length: {maximum: 30}
  has_one_attached :avatar, dependent: :destroy
end
