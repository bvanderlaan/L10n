class RootString < ActiveRecord::Base
	has_many :TranslatedString, dependent: :destroy
end
