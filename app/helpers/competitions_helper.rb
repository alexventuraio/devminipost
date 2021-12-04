module CompetitionsHelper
  # TODO: handle this more properly, maybe with something like Pundit
  def is_owner?(competition)
    current_user == competition.user
  end
end
