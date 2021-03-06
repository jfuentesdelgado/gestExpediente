class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #para usar un layout distinto a aplicacion
  layout "bootstrap"

  before_action :authorize, :defaultyear


  protected
  	def authorize
  		unless User.find_by(id: session[:user_id])
  			redirect_to login_url, notice: "Por favor introduzca su nombre y contraseña"
  		end
  	end

  	def defaultyear
  		if session[:year]==nil  
	      fecha=Time.new  
	      session[:year]= fecha.year
    	end
    	# @year = session[:year]
	end

end
