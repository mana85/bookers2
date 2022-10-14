class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user_id
    @book_image.save
    redirect_to  user_path(@book.user_id)
  end

  def index
  end

  def show
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).parmit(:title, :body)
  end

end
