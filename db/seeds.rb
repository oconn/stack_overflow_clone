# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

25.times do
	User.create(username: Faker::Lorem.word,
		          email: Faker::Internet.email,
		          password: "12345678",
		          password_confirmation: "12345678")
end

User.all.each do |user|
  2.times do 
    Question.create(user_id: user.id,
                    title: Faker::Lorem.words(num = 4).join,
                    body: Faker::Lorem.paragraph) 
  end
end