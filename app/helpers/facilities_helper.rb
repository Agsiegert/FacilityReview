module FacilitiesHelper
  def format_title(facilities)
    if facilities.size == 0
      content_tag(:strong, "No Facilities Found")
    else
      pluralize(@facilities.size, 'Facility')
    end
  end

  def image_for(facility)
    if facility.logo_url.blank? || facility.logo_url.nil?
      image_tag('placeholder.png')
    else
      image_tag(facility.logo_url)
    end
  end

end
