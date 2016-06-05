class TranslatedString < ActiveRecord::Base
  belongs_to :root_string
  belongs_to :language
end
