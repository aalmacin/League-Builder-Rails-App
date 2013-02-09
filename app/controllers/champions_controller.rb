class ChampionsController < ApplicationController
  before_filter :check_if_logged_in
  def index
    @championships = Champion.all
  end
end
