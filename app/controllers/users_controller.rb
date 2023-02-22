class UsersController < ApplicationController


def show
  @user = Use.find(params[:id])
  @books = @user.books.page(params[:page])
end

def create
end 

def index
end

def edit
end

private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end  