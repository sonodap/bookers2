class UsersController < ApplicationController


def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
end


def index
end

def edit
  @user = User.find(params[:id])

end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    # flash[:notice] = "You have created book successfully."
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