class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:login]
URL = "https://api.weixin.qq.com/sns/jscode2session".freeze


  def wechat_user
    wechat_params = {
      appId: ENV["WECHAT_APP_ID"],
      secret: ENV["WECHAT_APP_SECRET"],
      js_code: params[:code],
      grant_type: "authorization_code"
    }

    @wechat_response ||= RestClient.get(URL, params: wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def login
    open_id = wechat_user.fetch("openid")
    @user = User.find_by(open_id: open_id)
    puts @user
    if @user.nil?
      @user = User.create(
        email: open_id + '@aixuexi.com',
        password: '123456',
        open_id: open_id
      )
    end
    render json: {
      user: @user
    }
  end
end
