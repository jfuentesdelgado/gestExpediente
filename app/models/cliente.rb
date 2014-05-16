class Cliente < ActiveRecord::Base
	has_many :registros, dependent: :restrict_with_error
end
