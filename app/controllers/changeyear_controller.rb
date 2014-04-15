class ChangeyearController < ApplicationController
  def change

  end

  def fixyear
  	session[:year] = params[:year]
  	redirect_to root_url
  end
end
