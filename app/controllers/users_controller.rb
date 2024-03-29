class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
end

def index
  @user = current_user
  @users = User.all
  @book = Book.new
end

def edit
  @user = User.find(params[:id])
  unless @user == current_user
      redirect_to  user_path(@user.id)
  end
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
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user), notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end