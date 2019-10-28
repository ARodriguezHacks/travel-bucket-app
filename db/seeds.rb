require 'random_data'
require 'faker'

2.times do
  user_name = Faker::TvShows::VentureBros.character
  User.create!(
    name: user_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence,
    activated: true,
    activated_at: Time.zone.now
  )
end
users = User.all

10.times do
  Topic.create!(
    name: Faker::TvShows::VentureBros.organization,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

50.times do
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

posts = Post.all

100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::TvShows::VentureBros.quote
  )
end

admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin',
  activated: true,
  activated_at: Time.zone.now
)

member = User.create!(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld',
  activated: true,
  activated_at: Time.zone.now
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
