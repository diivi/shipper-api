class Warehouse < ApplicationRecord
    belongs_to :business
    has_many :items, dependent: :destroy
    validates :name, presence: true
    validates :max_items, presence: true
    validates :location, presence: true
end
