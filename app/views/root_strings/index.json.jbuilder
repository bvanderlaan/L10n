json.array!(@root_strings) do |root_string|
  json.extract! root_string, :id, :string, :comment
  json.url root_string_url(root_string, format: :json)
end
