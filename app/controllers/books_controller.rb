class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to  book_path(@book.id)
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book_show = Book.find(params[:id])
    @user = User.find(@book_show.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(update_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(@book.user_id)
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    # 投稿はこっちじゃないと動かない
    params.permit(:title, :body)
  end

  def update_params
    # 更新はこっちじゃないと動かない…
    params.require(:book).permit(:title, :body)
  end

end
