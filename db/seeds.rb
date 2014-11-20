# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Role.delete_all
user = User.create(:email => 'admin@example.com', :password => "test1234", :password_confirmation => "test1234",
					:dob => "05/03/1988", :ccn => "4111111111111111") # DOB is mm/dd/yyyy
admin_role = Role.create(:name => 'admin')
user.roles << admin_role

