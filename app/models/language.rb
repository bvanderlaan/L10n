class Language < ActiveRecord::Base
	has_many :translated_string, dependent: :destroy
	validates :langname, presence: true, length: { maximum: 50 }
	validates :langcode, presence: true, length: { maximum: 10 }
end
