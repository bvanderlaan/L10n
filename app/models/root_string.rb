class RootString < ActiveRecord::Base
	has_many :translated_string, dependent: :destroy
	validates :string, presence: true
	validates :comment, length: { maximum: 255 }
end
