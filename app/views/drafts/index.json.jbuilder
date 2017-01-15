json.array!(@drafts) do |draft|
  json.extract! draft, :id, :title, :content, :user_id
  json.url draft_url(draft, format: :json)
end
