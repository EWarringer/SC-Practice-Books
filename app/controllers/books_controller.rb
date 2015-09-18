class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    # binding.pry
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book successfully created"
      redirect_to books_path
    else
      flash[:notice] = @book.errors.full_messages.join(" & ")
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :isbn_code, :description, :genre)
  end
end
