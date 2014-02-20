# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Facility.create!([
  {
    iTriage_id: 1,
    name: "Urgent Cares",
    logo_url: "http://placekitten.com/200/300",
    street: "1234 One Lane",
    city: "Denver",
    state: "CO",
    zip: "80201",
    phone: 1111111111,
    tagline: "This is a description of services of the Urgent Cares facility."
  },
  {
    iTriage_id: 2,
    name: "Urgent Careing",
    logo_url: "http://placekitten.com/200/300",
    street: "2234 Two Lane",
    city: "Denver",
    state: "CO",
    zip: "80202",
    phone: 2222222222,
    tagline: "This is a description of services of Urgent Caring facility."
  },
  {
    iTriage_id: 3,
    name: "Urgent Careful",
    logo_url: "http://placekitten.com/200/300",
    street: "3234 Three Lane",
    city: "Denver",
    state: "CO",
    zip: "80203",
    phone: 3333333333,
    tagline: "This is a description of services of Urgent Careful facility."
  }
  ])
