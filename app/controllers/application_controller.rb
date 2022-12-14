class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resouce)
    # サインインした後に遷移する場所（一旦aboutページ。実際はuserページ＊後で変更）
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resouce)
    # サインアウトしたらルートページに遷移する
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
