class Cart < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products
  before_create { self.completion_status ||= false }
  before_create { self.final_bill ||= 0 }
end
