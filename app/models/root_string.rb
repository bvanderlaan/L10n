class RootString < ActiveRecord::Base
	has_many :translated_string, dependent: :destroy
end
