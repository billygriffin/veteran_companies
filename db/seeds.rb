# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create(
  name: "Base Directory",
  url: "https://www.basedirectory.com",
  employees_count: 4,
  total_funding: 0,
  stage: "Pre Series A",
  year_founded: 4.years.ago,
  qualification: "2 of 2 vet cofounders"
)

Company.create(
  name: "Uvize",
  url: "https://www.uvize.com",
  employees_count: 4,
  total_funding: 500,
  stage: "Pre Series A",
  year_founded: 2.years.ago,
  qualification: "2 of 4 vet cofounders"
)

Admin.create(
  email: 'admin@vetco.com',
  password: 'password',
  password_confirmation: 'password'
)
