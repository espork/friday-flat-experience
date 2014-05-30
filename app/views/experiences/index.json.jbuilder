json.array!(@experiences) do |experience|
  json.extract! experience, :id, :category_id, :public, :title, :description, :included, :not_included, :duration, :max_group_size, :availability, :additional_information
  json.url experience_url(experience, format: :json)
end
