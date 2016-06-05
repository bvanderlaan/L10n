json.array!(@languages) do |language|
  json.extract! language, :id, :langname, :langcode
  json.url language_url(language, format: :json)
end
