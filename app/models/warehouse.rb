class Warehouse < ApplicationRecord
    belongs_to :business
    validates :name, presence: true
    validates :max_items, presence: true
    validates :location, presence: true
end
