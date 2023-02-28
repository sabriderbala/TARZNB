class PagesController < ApplicationController
  def home
  end

  def dashboard
    @mycabans = current_user.cabans
  end
end
