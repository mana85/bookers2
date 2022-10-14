class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # Bookを作ったらここに @books = @user.booksとか書いて該当ユーザが投稿したブックのリストを取得する
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
