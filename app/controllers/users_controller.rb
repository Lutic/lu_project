class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    @user.password = @user.password.crypt(User::SALT)
    if @user.save
      flash[:notice] = 'Thank you for registration!'
      redirect_to tasks_path
    else
      flash[:error] = 'Error of registration.'
      @user.password = params[:user][:password]
      render :action => :new
    end
  end
  
  def login
    if params[:user]
      login = params[:user][:login]
      password = params[:user][:password]
      @user = User.find_by_login(login)
      if @user and @user.password == password.crypt(User::SALT)
        flash[:notice] = "Welcome, #{@user.login}!"
        session[:user_id] = @user.id
        redirect_to tasks_path 
      else
        flash[:error] = 'Wrong login and/or password.'
        @user.password = nil
        render :action => :login
      end
    else
      @user = User.new
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = 'You`re successfully checked out.'
    redirect_to tasks_path
  end
end
