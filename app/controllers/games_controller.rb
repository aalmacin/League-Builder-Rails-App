class GamesController < ApplicationController
  before_filter :check_if_logged_in
  def index
  end
end
