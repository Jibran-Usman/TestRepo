class WelcomeController < ApplicationController
  def Index
  	if user_signed_in?
  		redirect_to articles_path
  	end
  end
end
