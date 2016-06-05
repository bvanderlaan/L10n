json.array!(@languages) do |language|
  json.extract! language, :id, :lang, :langcode
  json.url language_url(language, format: :json)
end
