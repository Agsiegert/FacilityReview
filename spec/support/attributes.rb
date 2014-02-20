def facility_attributes(overrides = {})
  {
    iTriage_id: 1,
    name: "Urgent Cares",
    street: "1234 One Lane",
    city: "Denver",
    state: "CO",
    zip: "80201",
    phone: 1111111111,
    tagline: "This is a description of services of this facility."
    }.merge(overrides)
end
