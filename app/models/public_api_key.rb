class PublicApiKey < ApplicationRecord
  belongs_to :business
  validates :key, presence: true, uniqueness: true
end