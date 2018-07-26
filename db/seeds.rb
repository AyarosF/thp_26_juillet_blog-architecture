# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


50.times do
  a = Faker::Address.city
  City.create(name: a, postal_code: "#{rand(95)}000")
end

50.times do
  a = Faker::Community.characters
  User.create(first_name: a.partition(' ').first, last_name: a.partition(' ').last, description: "Salut je m'appelle #{a}", email: "#{a.chars[0]}.#{a.partition(' ').last}", age: rand(16..55), city_id: rand(50))
end

for i in (1..50)
	a = Faker::ChuckNorris.fact
	b = rand(50)
	PrivateMessage.create(content: a, sender_id: b)
	c = rand(3)
	c.times do
	ReceivedMessage.create(private_message_id: b, recipient_id: rand(50))
end
end

50.times do
	a = Faker::ChuckNorris.fact
	b = Faker::Date.backward(50)
	Gossip.create(title: a.truncate(30, separator: ' '), content: a, user_id: rand(1..50), date: b.to_time)
end

50.times do
  a = Faker::Book.genre
  Tag.create(title:"##{a}")
end

for i in (1..Gossip.all.count)
  Tag.find(rand(1..Tag.all.count)).gossips << Gossip.find(i)
end

for i in (1..Tag.all.count)
  Gossip.find(rand(1..Gossip.all.count)).tags << Tag.find(i)
end


50.times do
  a = ['Super article', 'Wahou, je savais pas', 'Devenez riche sans effort depuis chez vous, visitez le site devenezrichesanseffortdepuischezvous.fr','Quelqu\'un peut me traduire cet article ?', 'Génial','Je vais partager cette info sur FB','Trop fun lol','Whoop whoop','Salut, qui veut échanger avec moi sur le sujet ?' ]
  Comment.create(content: a.sample, user_id: rand(50), gossip_id: rand(50) )
end

50.times do
	Like.create(user_id: rand(50), gossip_id: rand(50))
	Like.create(user_id: rand(50), comment_id: rand(50))
end

50.times do
  Reply.create(content: Faker::HarryPotter.spell, user_id: rand(50), comment_id: rand(50))
end
