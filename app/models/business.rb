class Business < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :warehouses
  has_many :items, through: :warehouses
  has_many :shippings
  has_many :public_api_keys, dependent: :destroy
end
