class TranslatedString < ActiveRecord::Base
  belongs_to :root_string
  belongs_to :language
  validates :translation, presence: true
  validates :comment, length: { maximum: 255 }
end
