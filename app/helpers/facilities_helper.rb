module FacilitiesHelper
  def format_title(facilities)
    if facilities.size == 0
      content_tag(:strong, "No Facilities Found")
    else
      pluralize(@facilities.size, 'Facility')
    end
  end
end
