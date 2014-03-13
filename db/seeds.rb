# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

usernames = ["Jake_The_Snake", "Mr_Frowny", "The_great_disposable", "I_dont_know_what_to_add_as_a_name", "Im_not_very_creative", "Capt_America", "Cobra_Commander", "Batman", "Jesus", "Obama", "Hitler", "Wolverine", "Cyclops", "Robocop", "Collosus", "Beast", "Zealot", "Professor_X", "Magneto", "Mr_Roboto", "Saber_Tooth", "Storm", "Mary", "Jane", "Banshee", "Master Chief", "Spiderman", "Peter_Parker", "Bruce_Willis", "Kori Roys", "KSolo", "Alyssa", "Torey", "Ryan", "Thomas", "Alex", "Ian_(TERMAINTATOR)", "Jay", "Matt", "Neal", "Andrew", "Amarra", "Dan"]
emails = ["this_will_be_valid_email@that.com"]

usernames.each_with_index do |name, index|
	User.create(username: name,
		          email: "#{index}#{Faker::Internet.email}",
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

Question.all.each do |question|
  3.times do
    question.answers.create(user_id: rand(1..25),
                          body: Faker::Lorem.paragraph)
  end
end

Answer.all.each do |answer|
  2.times do
    answer.comments.create(user_id: rand(1..25), body: Faker::Lorem.words(num=5).join)
  end
end

Question.all.each do |question|
  2.times do
    question.comments.create(user_id: rand(1..25), body: Faker::Lorem.words(num=5).join)
  end
end

User.all.each do |user|
  if !user.valid?
    user.delete
  end
end
