class UsersController < ApplicationController

# def new
#   @user = User.new
# end

def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
end

def create
  @user = User.new(book_params)
  @user.user_id = current_user.id
  if @book.save
    redirect_to user_path(@user.id)
    flash[:notice] = "You have created book successfully."
  else
    render :top
  end

end


def index
  @user = current_user
  @users = User.all
end

def edit
  @user = User.find(params[:id])
  flash[:notice] ="You have updated user successfully."
end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
      @users= User.all
      render :edit
    end
end

private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end