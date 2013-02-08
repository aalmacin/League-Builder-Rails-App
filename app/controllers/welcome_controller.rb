class WelcomeController < ApplicationController
  before_filter :check_if_logged_in
  def home
  end
end
