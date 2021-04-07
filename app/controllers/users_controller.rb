class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      flash(@user.errors.full_messages)
      redirect_to new_user_url
    end
  end
  
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login!(@user)
      redirect_to :show
    else
      flash.now(@user.errors.full_messages)
      render :new
    end
  end

  private

  def user_params(params)
    params.require(:user).permit(:user_name, :password)
  end

end
