json.array!(@translated_strings) do |translated_string|
  json.extract! translated_string, :id, :translation, :comment, :rootstring_id, :language_id
  json.url translated_string_url(translated_string, format: :json)
end
