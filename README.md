FacilityReview
==============

An app to read and write reviews for iTriage listed Urgent Care Facilities

Facility Review Users:
----------------------
Begin by providing a location to search for facilities

- Location can be entered one of two ways:
      - Manually entering a location, as simlple as Denver, CO or as detailed as a full street address.
          - App uses the Ruby Geocoder gem to transition input into latitude and Longitude
      - Latitude and Longitude can also be retrieved from IP address if tracking is turned on in the browser and option is selected.

The app sends the request to the iTraige API with the Latitude and Longitude interpolated and returns a list of the 20 closest facilities within a 25 mile radius.

As a user you can choose a facility then read reviews or write a review by providing a first name or initial, a last name or initial and valid email address.

FacilityReview API endpoints
----------------------------
An API is provided for Names, Email and Review Content which can be consumed by the public (or added to the iTriage app.)

API provides the following endpoints:
- By iTriage Facility_id#
  - Review Author name or initials
  - Review Author email
  - Review contents


iTriage API for Facilities
----------------------------------------------------

iTriage API provides Facility information based on several variables.
  - begin with: `https://www.itriagehealth.com/api/v1/medical_providers.json?`
      - Returns all providers but only gives first few and includes all providers starting with physicians,                    hospitals, home care, urgent care etc.

The following additions to the above string provides additional filters:
- `search_model=medical_facilities`
    - Adds sub category 1 (medical facility as opposed to say physicians etc)

- `&callback=jQuery172038924280017105417_1392458642492`
    - This appers to be iTriage tracking and adds “ jQuery172038924280017105417_1392458642492 “ to results. (This is not necessary to return results)

- `&per_page=20`
    - how many results are provided (if left off would it give all)

- `&sort_by=featured`
    - sorts order by network, featured, distance, and ??? (this iteration will stick to distance)

- `&distance=25`
    - results up to distance in miles away

- `&medical_facility_categories=2`
    - sub category 2 (urgent care facilities == 2)"****"

- `&medical_facility_sub_categories=`
    - sub category (assume there are no sub cat for urgent care (NOT required for call, used for specialties etc.)

- `&family_member_id=null`
    - ???(insurance network? NOT required)

- `&lat=39.737567&lng=-104.98471790000002`
    - Requested search location (denver) this is 2 params lat & long

- `&_=1392458853569`
    - assuming this is user cookie/session/id (not required)

