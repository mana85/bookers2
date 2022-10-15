class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to  user_path(@book.user_id)
  end

  def index
    @books = Book.all
  end

  def show
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.permit(:title, :body)
  end

end
