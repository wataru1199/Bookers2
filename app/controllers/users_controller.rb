class UsersController < ApplicationController
 
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.all
  end
  

  def edit
    @user = User.find(params[:id])
    @title= @user.name
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end
  
  def update
      @user = User.find(params[:id])
   if @user.update(user_params)
      flash[:success]= "successfully updated"
      redirect_to user_path(current_user.id)
   else
     
      render action: :edit
   end
  end
  
  def index
       @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end