class Transitario < ActiveRecord::Base
	has_many :registros, dependent: :restrict_with_error
end
