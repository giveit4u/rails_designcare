class OmniauthCallbacksController < ApplicationController
  def google_oauth2
    handle_auth
  end

  def kakao
    handle_auth
  end

  private

  def handle_auth
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)

    if user.persisted?
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "#{auth.provider.capitalize} 계정으로 로그인되었습니다."
    else
      redirect_to login_path, alert: "로그인 중 오류가 발생했습니다."
    end
  end
end
