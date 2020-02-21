class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :photo, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo
end
