class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @book = Book.find(params[:book_id])
    @review.book = @book

    if @review.save
      redirect_to book_path(@book)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end
  
  protected
  def review_params
    params.require(:review).permit(:body, :rating, :book_id)
  end
end
