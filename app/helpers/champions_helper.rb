module ChampionsHelper
  def mvp_of_the championship
    championship[:mvp_name]
  end

  def victor_in_the championship
    full_name_of Team.find(championship[:champ_id])
  end

  def year_of_the championship
    championship[:year]
  end

  def runner_up_of_the championship
    full_name_of Team.find(championship[:runner_up_id])
  end

  def runner_up_mvp_in_the championship
    championship[:runner_up_mvp_name]
  end
end
