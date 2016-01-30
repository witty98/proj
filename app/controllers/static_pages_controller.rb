class StaticPagesController < ApplicationController
  def home
    @worklog = current_user.worklogs.build if logged_in?
  end
  def about
  end
  def contact
  end
end
