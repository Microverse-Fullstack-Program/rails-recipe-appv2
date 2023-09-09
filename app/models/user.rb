class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :inventories
  has_many :recipes
  has_many :foods, join_table: :recipe_foods, through: :recipes

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :password_confirmation, presence: true
end
