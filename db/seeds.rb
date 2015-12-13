# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# default users
user = User.create({
    :email => "a@a.com",
    :name => "Example User",
    :password => '123',
  })

Account.create({
    :name => "Commonwealth Bank", 
    :user_id => user.id,
    :type => 'checkings',
    :balance => 1000,
  })

Account.create({
    :name => "Bank of America",
    :user_id => user.id,
    :type => 'savings',
    :balance => 1500,
  })
