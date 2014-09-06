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

Post.create(title: "Reddit Is Awesome!", url: "reddit.com", description: "Le Reddit, the moral backbone of a planet.", user_id: 1)
Post.create(title: "A Great Programmer News Site", url: "hackernews.com", description: "Yeah, this is a really good news site!", user_id: 2)
Post.create(title: "Tealeaf Academy", url: "gotealeaf.com", description: "You won't need to read tealeaves in order to build Rails apps thanks to Tealeaf Academy", user_id: 1)

PostCategory.create(post_id: 1, category_id: 1)
PostCategory.create(post_id: 1, category_id: 4)
PostCategory.create(post_id: 2, category_id: 1)
PostCategory.create(post_id: 2, category_id: 2)
PostCategory.create(post_id: 3, category_id: 3)
