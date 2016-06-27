# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Title.create(:Title_ID =>'1',:Title_Name =>'Mr')
Title.create(:Title_ID =>'2',:Title_Name =>'Mrs')
Title.create(:Title_ID =>'3',:Title_Name =>'Miss')
Title.create(:Title_ID =>'4',:Title_Name =>'Dr')
Title.create(:Title_ID =>'5',:Title_Name =>'Capt')
Title.create(:Title_ID =>'6',:Title_Name =>'Prof')
# User.create(:email => 'me@me.com',:name => 'me',:role => 1,:password => '123456', :password_confirmation => '123456' );
# User.create(:email => 'admin@pnec.com',:name => 'Admin',:role => 2,:password => '123456', :password_confirmation => '123456' );
# Category.create(:Category_Name =>'Shoes',:Description => 'Njumu kali kali mse')
