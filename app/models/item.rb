class Item < ApplicationRecord
  belongs_to :warehouse
  belongs_to :category
end
