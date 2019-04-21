# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

5.times do
  User.create!(email: FFaker::Internet.safe_email,
               password: FFaker::Internet.password,
               first_name: FFaker::Name.first_name,
               last_name: FFaker::Name.last_name,
               birthday: Time.now,
               city: FFaker::Address.city,
               country: FFaker::Address.country)
end

15.times do
  Article.create!(author: User.order('RANDOM()').first,
                  title: FFaker::Book.title,
                  text: FFaker::Book.description)
end
