# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# basic scale of seeds
N = 10
User.delete_all
Post.delete_all


# Users:
N.times do 
user = User.create!( 
        firstname: Faker::Name.first_name , lastname: Faker::Name.last_name , 
        email: Faker::Internet.email, 
            password: 'topsecret', password_confirmation: 'topsecret' 
        )

end

# Posts: and comments:

# create a random list of existing users
random_users = Array.new(N) { rand( 1..User.count ) }
# now, each of these cretes a post
random_users.each do |user_id|
    
    
post = Post.create!(
        user: User.find( user_id),
        post: nil,
        title: Faker::Lorem.sentence,
        body:  Faker::Lorem.paragraph,
    )

# now, each post has a few comments 0...4
random_commenters = Array.new(rand 5) { rand(1...User.count) }

random_commenters.each do |commenter_id|
    comment = Post.create!( 
        user: User.find( commenter_id ),
        post: post,     # refer to the post
        title: nil,     # no titles for comments
        body: Faker::Lorem.sentence,
        )
    end
    
end

puts "User count: #{User.count}"
puts "Post count: #{Post.count}"

