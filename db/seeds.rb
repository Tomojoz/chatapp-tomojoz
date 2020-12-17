# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tom = User.create!(email: 'tom@example.com', password: 'password')
emma = User.create!(email: 'emma@example.com', password: 'password')

5.times do
    tom.boards.create!(
        title: Faker::Lorem.sentence(word_count: 5),
        description:Faker::Lorem.sentence(word_count: 30)
    )
end

5.times do
    emma.boards.create!(
        title: Faker::Lorem.sentence(word_count: 5),
        description:Faker::Lorem.sentence(word_count: 30)
    )
end