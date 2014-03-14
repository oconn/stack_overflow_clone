# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "oconn",
            email: "matt@gmail.com",
            password: "testtest",
            password_confirmation: "testtest")

User.create(username: "slim_johnson",
            email: "pencildick@gmail.com",
            password: "12345678",
            password_confirmation: "12345678")

User.create(username: "BATMAN",
            email: "batlove@gmail.com",
            password: "12345678",
            password_confirmation: "12345678")

User.create(username: "DANIMAL",
            email: "JSWIZ@gmail.com",
            password: "12345678",
            password_confirmation: "12345678")

User.create(username: "poodlesaurus",
            email: "fluffpuff@gmail.com",
            password: "12345678",
            password_confirmation: "12345678")

User.create(username: "ice_man",
            email: "topgunfetish@gmail.com",
            password: "12345678",
            password_confirmation: "12345678")

User.create(username: "clown_dev",
            email: "clownsrllcoolj@gmail.com",
            password: "12345678",
            password_confirmation: "12345678")

Question.create(user_id: 1,
                title: "Why am I the bootstrap king?!",
                body: <<-BLOCK
"We totally learned about boots in the Navy; but straps? What gives?"

```ruby
def batman
  @awesome
end
```
BLOCK
)

Question.create(user_id: 2,
                title: "What am I doing?!",
                body: <<-BLOCK
HELP ME!!!!!!!

```ruby
def add
  1 + 1 == 3
end
```

Why do I keep getting false?
BLOCK
)

Answer.create(user_id: 3,
              question_id: 2,
              body:<<-BLOCK
because 1 + 1 == 4
BLOCK
)

# matt.questions.create(title: "How can I go to the gym when there are constant presentations?",
#                       body: "Dude - stop scheduling stuff at lunch. Some of us need to maintain a figure... How can you do this to me?")

# slim.questions.create(title: "Penis enlargment?",
#                       body: "I haven't been able to find any resources or ads on the internet about this. Please help me locate some!")

# bat.questions.create(title: "Where is the Joker?",
#                       body: "He's a total dick - need to stop him before he wrecks Gotham(Chicago) again.")

# bat.questions.create(title: "Who stole my bat-based vehicle?",
#                       body: "Seriously; what gives?!")

# dan.questions.create(title: "I'M THE FUCKING BEST",
#                       body: "NO QUESTION - JUST A STATEMENT. DEAL WITH IT.")

# dan.questions.create(title: "Do you even know how to fox?",
#                       body: "It's peanut butter jelly time!")

# amara.questions.create(title: "How many poodles is too many?",
#                       body: "I'm thinking about adopting another 231 poodles, but I think I could keep a few more? How many is too many?")

# amara.questions.create(title: "How poodlerific are you?",
#                       body: "POODLE R TEH BEST!")

# andrew.questions.create(title: "Why does the brown line suck so much?",
#                        body: "Stop holding for clearance! The train can't be that bad?!")

# andrew.questions.create(title: "We're doing what not?!",
#                        body: "I wasn't paying attention - why what huh bluh?!")


# usernames = ["Jake_The_Snake", "Mr_Frowny", "The_great_disposable", "I_dont_know_what_to_add_as_a_name", "Im_not_very_creative", "Capt_America", "Cobra_Commander", "Batman", "Jesus", "Obama", "Hitler", "Wolverine", "Cyclops", "Robocop", "Collosus", "Beast", "Zealot", "Professor_X", "Magneto", "Mr_Roboto", "Saber_Tooth", "Storm", "Mary", "Jane", "Banshee", "Master Chief", "Spiderman", "Peter_Parker", "Bruce_Willis", "Kori Roys", "KSolo", "Alyssa", "Torey", "Ryan", "Thomas", "Alex", "Ian_(TERMAINTATOR)", "Jay", "Matt", "Neal", "Andrew", "Amarra", "Dan"]
# emails = ["this_will_be_valid_email@that.com"]

# usernames.each_with_index do |name, index|
# 	User.create(username: name,
# 		          email: "#{index}#{Faker::Internet.email}",
# 		          password: "12345678",
# 		          password_confirmation: "12345678")
# end

# User.all.each do |user|
#   2.times do
#     Question.create(user_id: user.id,
#                     title: Faker::Lorem.words(num = 4).join,
#                     body: Faker::Lorem.paragraph)
#   end
# end

# Question.all.each do |question|
#   3.times do
#     question.answers.create(user_id: rand(1..25),
#                           body: Faker::Lorem.paragraph)
#   end
# end

# Answer.all.each do |answer|
#   2.times do
#     answer.comments.create(user_id: rand(1..25), body: Faker::Lorem.words(num=5).join)
#   end
# end

# Question.all.each do |question|
#   2.times do
#     question.comments.create(user_id: rand(1..25), body: Faker::Lorem.words(num=5).join)
#   end
# end

# User.all.each do |user|
#   if !user.valid?
#     user.delete
#   end
# end
