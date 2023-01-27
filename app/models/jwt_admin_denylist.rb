class JwtAdminDenylist < ApplicationRecord
    include Devise::JWT::RevocationStrategies::Denylist
    self.table_name = 'jwt_admin_denylist'
end
