# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Title.create(:Title_ID =>'2',:Title_Name =>'Mr')
# User.create(:User_ID =>'123', :Username => 'paul',:password_digest =>'password', :email =>'me@me.com',:DOB => '4/4/1990',:Status =>1,:Role => 1, :Gender =>'male',:Title_ID => 1);
User.create(name: "Michael Hartl", email: "me@me.com",password: "password", password_confirmation: "password", Title_ID: 1,role: 1,gender: 'male',status: 1)