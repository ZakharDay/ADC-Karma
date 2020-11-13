class Service < ApplicationRecord

  def as_json_for_main_page
    {
      title: title,
      description: description,
      requirements: requirements,
      duration: duration,
      correction_time: correction_time
    }
  end

end
