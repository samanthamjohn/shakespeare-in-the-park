Users = []
user_array = YAML.load_file(Rails.root.join("config/users.yml"))
user_array.each do |user|
  Users << Hashie::Mash.new(user)
end
