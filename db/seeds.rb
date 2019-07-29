# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create(title: "test party", location: "test city", description: "come test with us", host: 1)

Group.create(name: "Group test", description: "best test group")

User.create(name: "test guy", age: 21, bio: "lorum ipsom", password: "password")

UserGroup.create(group_id: 1, user_id: 1)

UserEvent.create(event_id: 1, user_id: 1)