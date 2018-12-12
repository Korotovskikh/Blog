# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Mark.destroy_all
Post.destroy_all
User.destroy_all

users_data = 20.times.map do	
  {
  	email: FFaker::Internet.email,
    password: '123123',
  	name: FFaker::Internet.user_name
  }
end

users = User.create! users_data

User.first(7).each{ |user| user.update creator: true }
User.first(2).each{ |user| user.update moderator: true }

creators = User.where(creator: true)

posts_data = 30.times.map do
  {
    user: creators.sample,
    title: FFaker::Lorem.paragraph[0...90],
    body: FFaker::Lorem.paragraphs.join[0...5_000]
  } 
end

posts = Post.create! posts_data

comments_data = 200.times.map do
  commentable = ((rand(2) == 1) ? posts : users).sample
  #Можно: commentable = ([posts, users].sample).sample
  {
    user: users.sample,
    #commentable: posts.sample,
    body: FFaker::HipsterIpsum.paragraphs.join[0...600],
    #commentable_id: commentable.id,
    #commentable_type: commentable.class.to_s
    commentable: commentable
  }
end 

Comment.create! comments_data
