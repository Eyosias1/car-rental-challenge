class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @cars = Car.all.sample(4)
  end
end
