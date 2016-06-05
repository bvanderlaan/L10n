class TranslatedString < ActiveRecord::Base
  belongs_to :rootstring
  belongs_to :language
end
