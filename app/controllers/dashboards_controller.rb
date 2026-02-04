class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    # 현재 사용자의 구독 상태 및 요청 내역
  end
end
