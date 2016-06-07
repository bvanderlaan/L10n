class RootString < ActiveRecord::Base
	has_many :translated_strings, dependent: :destroy
	accepts_nested_attributes_for :translated_strings, :reject_if => proc { |attributes| attributes['translation'].blank? and attributes['comment'].blank? }, :allow_destroy => true
	validates :string, presence: true
	validates :comment, length: { maximum: 255 }
end
