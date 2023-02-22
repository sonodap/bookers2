class BooksController < ApplicationController
  
def new
  @books = Book.new
end 

def create
  @book = Book.new(book_params)
  @book.use_id = current_use.id
  @book.save
  redirect_to books_path
end  

def show
end

def edit
end

def update
end  

def index
end

def destroy
end

private

  def book_params
    params.require(:book).permit(:shop_name, :caption)
  end

end

