# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# coding: utf-8

require "csv"

CSV.foreach('db/artist.csv', headers: true) do |row|
  Artist.create(artist: row['artist'])
end

CSV.foreach('db/genre.csv', headers: true) do |row|
  Genre.create(genre: row['genre'])
end

CSV.foreach('db/label.csv', headers: true) do |row|
  Label.create(label: row['label'])
end

CSV.foreach('db/payment_method.csv', headers: true) do |row|
  Payment_method.create(payment_method: row['payment_method'])
end
