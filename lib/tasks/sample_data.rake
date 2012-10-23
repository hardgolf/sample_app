namespace :db do
  desc "Filling database"
  task populate: :environment do
    admin = User.create!(name: "Golf",
                 email: "golf@golf.com",
                 password: "golfgolf",
                 password_confirmation: "golfgolf")
    admin.toggle!(:admin)        
    99.times do |n|
      name = Faker::Name.name
      email = "a#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 10)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content)}
    end          
  end
end