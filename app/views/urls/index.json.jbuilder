json.array! @urls do |url|
  json.id url.id
  json.short_url url.short_url
  json.original_url url.original_url
  json.clicks url.clicks
  json.user_id url.user_id
end
