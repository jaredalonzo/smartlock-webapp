class User < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true,
    length: { minimum: 4 }
end
