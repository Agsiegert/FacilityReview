require "spec_helper"


describe "Viewing a list of facilities" do
  it "shows the facility" do
    facility1 = Facility.create!(iTriage_id: 1,
                                name: "Urgent Cares",
                                street: "1234 One Lane",
                                city: "Denver",
                                state: "CO",
                                zip: "80201"
                                )
    facility2 = Facility.create!(iTriage_id: 2,
                                name: "Urgent Careing",
                                street: "2234 Two Lane",
                                city: "Denver",
                                state: "CO",
                                zip: "80202"
                                )
    facility3 = Facility.create!(iTriage_id: 3,
                                name: "Urgent Careful",
                                street: "3234 Three Lane",
                                city: "Denver",
                                state: "CO",
                                zip: "80203",
                                phone: 3333333333,
                                tagline: "This is a description of services of this facility."
                                )
    visit facilities_path
    # save_and_open_page


    expect(page).to have_text("3 Facilities")
    expect(page).to have_text(facility1.name)
    expect(page).to have_text(facility2.name)
    expect(page).to have_text(facility3.name)

    expect(page).to have_text(facility3.iTriage_id)
    expect(page).to have_text(facility3.street)
    expect(page).to have_text(facility3.city)
    expect(page).to have_text(facility3.state)
    expect(page).to have_text(facility3.zip)
    expect(page).to have_content("(333) 333-3333")
    expect(page).to have_text(facility3.tagline)

  end

  it "shows 'No Facilities Found' if facilities is 0" do
    visit facilities_path

    expect(page).to have_text("No Facilities Found")
  end
end
