class SessionsController < ApplicationController
  def create
    @camper = Camper.find_or_create_from_auth(request.env['omniauth.auth'])
    if @camper
      session[:camper_id] = @camper.id
      redirect_to root
    else
      redirect_to root
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root, :notice => "Signed out!"
  end
end
