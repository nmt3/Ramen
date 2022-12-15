module Public::PostsHelper
  def weekly_columns
        ['activity_monday', 'activity_tuesday', 'activity_wednesday',\
        'activity_thursday', 'activity_friday', 'activity_saturday', 'activity_sunday']
  end

  def holiday_weekly_columns
        ['holiday_monday', 'holiday_tuesday', 'holiday_wednesday',\
        'holiday_thursday', 'holiday_friday', 'holiday_saturday', 'holiday_sunday']
  end
end
