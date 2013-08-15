admin = Admin.create(email: 'admin@example.com', password: 'password123', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
ApiKey.create
2.times { Project.create(name: Faker::Lorem.word) }
Project.last(2).each do |project|
  3.times do
    project.releases.create(branch: Faker::Name.name, environment: %w(production staging development).sample, deployed_at: DateTime.now, email_address: admin.email)
  end
end
