15.times do |n|
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'a',
    username: Faker::Internet.user_name)
  end

5.times do |o|
  Survey.create(
    name: Faker::Company.name)
  end

10.times do |p|
  Question.create(
    question: Faker::Company.bs)
  end

20.times do |q|
  Answer.create(
    answer: Faker::Company.catch_phrase)
  end


