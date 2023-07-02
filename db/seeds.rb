# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if User.count.zero?
  User.create! first_name: 'John', last_name: 'Doe', email: 'john@yopmail.com', password: 'topsecret', password_confirmation: 'topsecret', user_role: User.user_roles[:admin]
  User.create! first_name: 'James', last_name: 'Phelps', email: 'james.phelps@yopmail.com', password: 'topsecret', password_confirmation: 'topsecret', user_role: User.user_roles[:customer]
end
if Item.count.zero?
  admin_user = User.where(user_role: User.user_roles[:admin]).first

  item1  = Item.create(user_id: admin_user.id, name: 'Coffee',  price: 10, tax_rate: 10)
  item2 = Item.create(user_id: admin_user.id, name: 'Sugar',  price: 5, tax_rate: 10)
  offer1 = Offer.create(item_id: item1.id, discounted_item_id: item2.id, is_free: true)

  item3  = Item.create(user_id: admin_user.id, name: 'Pizza',  price: 10, tax_rate: 10)
  item4 = Item.create(user_id: admin_user.id, name: 'Pepsi',  price: 10, tax_rate: 10)
  offer2 = Offer.create(item_id: item3.id, discounted_item_id: item4.id, discount_percent: 10)

  item5  = Item.create(user_id: admin_user.id, name: 'Sandwitch',  price: 10, tax_rate: 5)
  item6  = Item.create(user_id: admin_user.id, name: 'Sauce',  price: 1, tax_rate: 0)
  offer3 = Offer.create(item_id: item5.id, discounted_item_id: item6.id, is_free: true)
end
