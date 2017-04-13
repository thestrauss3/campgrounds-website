# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'faker'

CampgroundAmenity.delete_all
Supply.delete_all
Camper.delete_all
Campsite.delete_all
Campground.delete_all
Amenity.delete_all




alpha = Campground.create name: "Alpha", description: "Beautiful forestry and pleasant streams make this campground a wonderful area to unwind after your hike. Although the campground has firepits present, we ask that you be responsible, put out the fire before leaving or going to sleep, and please don't leave any trash.", fee: 0
beta = Campground.create name: "Beta"
gamma = Campground.create name: "Gamma"
delta = Campground.create name: "Delta"

10.times do |i|
  Campsite.create campground: alpha, available: true, size: 4, campsite_num: i
  Campsite.create campground: beta, available: true, size: 4, campsite_num: i
  Campsite.create campground: gamma, available: true, size: 4, campsite_num: i
  Campsite.create campground: delta, available: true, size: 4, campsite_num: i
end

fakecamper = Camper.create name: Faker::Name.name, campsite: alpha.campsites.first
rovaira = Camper.create name: "Rovaira", campsite: alpha.campsites.first
jorge = Camper.create name: "Jorge", campsite: alpha.campsites.second
brian = Camper.create name: "Brian", campsite: alpha.campsites.third
jesse = Camper.create name: "Jesse", campsite: beta.campsites.first
maribeth = Camper.create name: "Maribeth", campsite: beta.campsites.first
kelly = Camper.create name: "Kelly", campsite: beta.campsites.second
david = Camper.create name: "David", campsite: gamma.campsites.first
philip = Camper.create name: "Phillip", campsite: gamma.campsites.second
kevin = Camper.create name: "Kevin", campsite: gamma.campsites.second


Supply.create name: "Eggs", camper: rovaira
Supply.create name: "Bacon", camper: philip
Supply.create name: "Plates", camper: david
Supply.create name: "Blankets", camper: jesse
Supply.create name: "Sleeping Bags", camper: jorge
Supply.create name: "Cups", camper: brian
Supply.create name: "Machete", camper: maribeth
Supply.create name: "trash bags", camper: kelly
Supply.create name: "compass", camper: kelly
Supply.create name: "Fire logs", camper: philip
Supply.create name: "pocket knife", camper: rovaira

showers = Amenity.create name: "Showers"
toilets = Amenity.create name: "Toilets", details: "Bring your own toilet paper."
hot_water = Amenity.create name: "Hot water"
fire_pits = Amenity.create name: "Fire pits"
logs_for_sale = Amenity.create name: "Firewood available for sale", details: "Prices may vary. Please inquire within."

CampgroundAmenity.create campground: alpha, amenity: showers
CampgroundAmenity.create campground: alpha, amenity: hot_water
CampgroundAmenity.create campground: alpha, amenity: toilets
CampgroundAmenity.create campground: alpha, amenity: fire_pits
CampgroundAmenity.create campground: alpha, amenity: logs_for_sale
CampgroundAmenity.create campground: beta, amenity: fire_pits
CampgroundAmenity.create campground: gamma, amenity: fire_pits
CampgroundAmenity.create campground: gamma, amenity: logs_for_sale

Campsite.all.each do |campsite|
  if campsite.campers.size != 0
    campsite.available = false
    campsite.save
  end
end

Review.create campground: alpha, camper: rovaira, title: "This place is great", body: "I have been here a hundred times and I love it", rating: 5

Review.create campground: alpha, camper: rovaira, title: "Great campgrounds", body: "This is one of my favorite campgrounds. It has hot water, showers and toilets and they sell firewood very close by. Recommend it to everyone", rating: 4
