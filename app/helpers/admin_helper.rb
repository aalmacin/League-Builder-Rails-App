module AdminHelper
  def message_about_season
    if season_started?
      return 'End season'
    else
      return 'Start season'
    end
  end
end
