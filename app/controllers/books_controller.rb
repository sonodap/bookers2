class BooksController < ApplicationController

before_action :authenticate_user!

def new
  @books = Book.new
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
    redirect_to books_path(@book.id)
    # redirect_to books_path(params[:id])
  else
    render :index
  end
end


def show
  # @book = Book.find(params[:id])
  # @users = @book.users
  # @user = user.new
end


def update
end

def index
  @books = Book.all
  @user = User.all
end

def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

