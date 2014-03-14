# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "abed",
            email: "abed@abed.com",
            password: "password",
            password_confirmation: "password")


usernames = ["Troy", "Britta", "Annie", "Pierce", "Chang", "Jeff", "Shirley"]
emails = []

usernames.each do |name|
	User.create(username: name,
		          email: "#{Faker::Internet.email}",
		          password: "12345678",
		          password_confirmation: "12345678")
end

Question.create(user_id: 1, title: "Why is the dragon sad?", body: "Why did you shit on his dreams?")
Answer.create(user_id: 2, question_id: 1, body: "Is it because he didn't watch Inspector Spacetime?")
Answer.create(user_id: 3, question_id: 1, body: "Because DBC really Brittad this project.")

Question.create(user_id: 5, title: "Q: What's the difference between the dinosaur and a dragon...?", body: "Dinosaurs are too young to smoke! har har har...")
Answer.create(user_id: 7, question_id: 2, body: "Go home Pierce.")
Answer.create(user_id: 6, question_id: 2, body: "CHANG CHANG CHANG CHANG")

Question.create(user_id: 4, title: "My Dragon smells...how do I even fix that with coding?")
Answer.create(user_id: 7, question_id: 3, body: "You don't")

Question.create(user_id: 7, title: "How do you cheer up a dragon?", body: "I found a sad dragon crying because Troy is gone...what should I do?")
Answer.create(user_id: 3, question_id: 4, body: "Sad dragons should be taken care of and their feelings respected. If you do not respect dragons and care about their feelings, they will stay sad. Seriously....be nice to dragons").comments.create(user_id: 7, body: "Shut up Britta")
