class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    # 결제 내역 전용 페이지
  end

  def new
    # 결제 시도 페이지
  end
end
