class Product < ApplicationRecord
  has_many :users, through: :review
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :carts

  validates :name,
            presence: true,
            length: { maximum: 50 },
            uniqueness: { case_sensitive: false }

  validates :price,
            presence: true

  validates :description,
            presence: true

end
