class HomeController < ApplicationController
  def index
  	session[:times_here] ||= 0
  	session[:times_here] += 1
  	
  	Rails.logger.info params.inspect #Выведет параметры, которые пришли в запрос
    params[:hello]
  	#render 'home/index'
  end

  def contacts
  end
end
