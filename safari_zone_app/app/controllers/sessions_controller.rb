class SessionsController < ApplicationController

  def new
    
  end

  def create
    username = params[:username]
    password = params[:password]
    trainer = Trainer.find_by(username: username)

    if trainer && trainer.authenticate(password)
      session[:current_user] = trainer.id
      redirect_to root_path
    else
      render :new
    end

  end

  def destroy
    session[:current_user] = nil
    redirect_to sessions_new_path
  end
end