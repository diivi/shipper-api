class Category < ApplicationRecord
    # integer volume
    # string name
    has_many :items
    validates :name, presence: true
    validates :volume, presence: true
end
