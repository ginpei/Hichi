# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

shop = Shop.create(screen_name:'tanemaki', name:'Tanemaki');
shop.chairs.create(left:100, top:100);
shop.chairs.create(left:200, top:100);
shop.chairs.create(left:300, top:100);
