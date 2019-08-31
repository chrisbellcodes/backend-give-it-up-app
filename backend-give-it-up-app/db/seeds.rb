# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chris = User.create(first_name: "Chris", last_name: "Bell", password: "abc123", email: "cdangelobell@gmail.com")
smoking = Category.create(name: "Smoking")
newports = Vice.create(name: "Newports", description: "Smoking's OUT anyway", amount: 13, category_id: smoking.id)
sub = Subscription.create(user_id: chris.id, vice_id: newports.id, status: "Active")
