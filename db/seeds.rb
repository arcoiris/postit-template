# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create(name: "News")
Category.create(name: "Programming")
Category.create(name: "Education")
Category.create(name: "Humor")

User.create(username: "bob", password: "password", password_confirmation: "password")
User.create(username: "hank", password: "password", password_confirmation: "password")

Post.create(title: "Reddit Is Awesome!", url: "reddit.com", description: "Yeah, this is a really good funny site!", user_id: 1)
Post.create(title: "A Great Programmer News Site", url: "hackernews.com", description: "Yeah, this is a really good news site!", user_id: 2)

PostCategory.create(post_id: 1, category_id: 4)
PostCategory.create(post_id: 2, category_id: 1)
PostCategory.create(post_id: 2, category_id: 2)
