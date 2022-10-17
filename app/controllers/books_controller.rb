class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to  book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
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
    is_matching_login_user
    @book = Book.find(params[:id])
  end

  def update
    is_matching_login_user
    @book = Book.find(params[:id])
    if @book.update(update_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
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

  def is_matching_login_user
    book = Book.find(params[:id])
    user_id = book.user_id.to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to "/books"
    end
  end

end
