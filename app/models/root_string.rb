class RootString < ActiveRecord::Base
	has_many :translated_strings, dependent: :destroy
	accepts_nested_attributes_for :translated_strings, :reject_if => proc { |attributes| attributes[:translation].blank? and attributes[:comment].blank? and attributes[:id].blank? }, :allow_destroy => true
	validates :string, presence: true
	validates :comment, length: { maximum: 255 }
	before_validation :remove_empty_translations, on: :update
	self.per_page = 15

	def self.search(query, page)
		where("string LIKE ?", "%#{query}%").order("lower(string)").paginate(:page => page)
	end
		
private
	
	def remove_empty_translations
		self.translated_strings.each do |ts|
			self.translated_strings.destroy ts if ts.translation.blank? and ts.comment.blank?
		end		
	end
end
