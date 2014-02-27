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

def review_attributes(overrides = {})
  {
    name: "A S",
    email: "as@example.com",
    # stars: 3,
    content: "The facility was great, from the recption to the treatment, thanks!"
  }.merge(overrides)
end
